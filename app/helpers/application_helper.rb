module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Transaction App'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def group_img(group)
    html = ''

    html << if group.image.attached?
              image_tag(group.image, class: 'group-image')
            else
              image_tag('default-avatar.png', class: 'group-image')
            end
    html.html_safe
  end

  def hours(log)
    log.amount
  end

  def minutes(log)
    log.amount
  end

  def total_sum
    sum = 0
    Log.where(author_id: current_user.id).each do |amount|
      sum += amount.amount
    end
    sum
  end

  def total_hours(sum)
    sum
  end

  def total_sum_b(sum)
  
  end

  def group_img_helper(log)
    html = ''
    html << group_img(log.groups.first) unless log.groups.first.nil?
    html << link_to('View Group', group_path(log.groups.first)) unless log.groups.first.nil?
    html.html_safe
  end
end
