class Coupon < ApplicationRecord
  belongs_to :user

  def usable?
    valid_on_count? && !valid_date
  end

  def valid_on_count?
    if kind.eq?('target')
      return(count>0)
    end
  end

  def valid_date
    if until_date > Time.now
      return false
    end
  end

  def compute_total(total)
    if discount.eq?('percent')
      percent_value = amount.to_f /100
      total - (total * percent_value)
    else 
      total = total - amount
      (total < 0) ? 0 :total
    end
  end

end