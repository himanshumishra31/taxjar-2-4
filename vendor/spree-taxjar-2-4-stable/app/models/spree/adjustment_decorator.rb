Spree::Adjustment.class_eval do

  def label
    if source.calculator.type == "Spree::Calculator::TaxjarCalculator".freeze
      label_attribute_value + ((order.additional_tax_total/order.amount) * 100).to_f.round(2).to_s + "%"
    else
      label_attribute_value + ((source.class == Spree::TaxRate) ? ((source.amount.to_f * 100).to_s + "%") : '')
    end
  end

  def label_attribute_value
    read_attribute(:label)
  end
end
