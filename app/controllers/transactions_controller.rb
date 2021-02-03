class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.includes(:groups).where(author_id: current_user.id)
        @transactions = @transactions.order('created_at DESC').paginate(page: params[:page], per_page: 15)
      end
    
      def individual
        @transactions = Transaction.includes(:groups).where(author_id: current_user.id)
        @transactions = @transactions.order('created_at DESC').reject { |transaction| transaction.groups.exists? }
        @transactions= @transactions.paginate(page: params[:page], per_page: 15)
      end
    
      def new
        @transactions = Transaction.new
        @groups = Group.all
      end
    
      def create
        @transaction = current_user.transactions.build(transaction_params)
        if @transaction.save
          flash[:success] = 'Your transaction has been created.'
          @transaction_group = TransactionGroup.new(transaction_id: @transaction.id, group_id: group_params[:group_id])
          flash[:success] = 'Your Transaction for this group has been created.' if @transaction_group.save
          redirect_to transactions_path
        else
          flash[:danger] = 'Please try again.'
          render 'new'
        end
      end
    
      private
    
      def transaction_params
        params.require(:transaction).permit(:name, :amount)
      end
    
      def group_params
        params.require(:transaction).permit(:group_id)
      end
end
