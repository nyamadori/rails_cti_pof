class FeatureRequest < ApplicationRecord
  belongs_to :issue

  default_scope { joins(:issue) }

  def method_missing(method, *args, &block)
    if respond_to?(method)
      __send__(method, *args, &block)
    elsif issue.respond_to?(method)
      issue.__send__(method, *args, &block)
    else
      super
    end
  end

  def respond_to?(method)
    puts method
    super || Issue.attribute_method?(method)
  end

  def issue
    super || build_issue
  end

  # def assign_attributes(new_attributes)
  # end

  def self.where(opts = :chain, *rest)
    case opts
    when Hash
      super(
        opts.map do |k, v|
          if Issue.has_attribute?(k)
            [Issue.table_name.to_sym, { k => v }]
          else
            [k, v]
          end
        end.to_h
      )
    else
      super
    end
  end
end
