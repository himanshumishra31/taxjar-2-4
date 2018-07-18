Spree::Adjustment.class_eval do

  def label
    if source.calculator.type == "Spree::Calculator::TaxjarCalculator"
      read_attribute(:label) + ((order.additional_tax_total/order.amount) * 100).to_f.round(2).to_s + "%"
    else
      rate_percent = (source.class == Spree::TaxRate) ? ((source.amount.to_f * 100).to_s + "%") : ''
      read_attribute(:label) + rate_percent
    end
  end
end
