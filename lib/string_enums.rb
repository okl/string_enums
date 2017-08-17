# = String Enums
#
# StringEnum is a concern that makes it easy to work with enums. Include the module, then invoke
# the class method string_enum with the attribute name followed by the list of valid values. This will
# add checks, writers, and constants for each value.
#
# == Example
# A class declares <tt>string_enum status: ['pending', 'in progress', 'completed']</tt>, which adds
# the following...
# ... checks:
# * <tt>pending?</tt>
# * <tt>in_progress?</tt>
# * <tt>completed?</tt>
#
# ... and writers:
# * <tt>mark_pending</tt>
# * <tt>mark_in_progress</tt>
# * <tt>mark_completed</tt>
#
# ... and constants:
# * <tt>STATUS_PENDING</tt>
# * <tt>STATUS_IN_PROGRESS</tt>
# * <tt>STATUS_COMPLETED</tt>
#
# Note that the string values with spaces are snake cased to provide method and constant names.
module StringEnums
  extend ActiveSupport::Concern

  module ClassMethods
    # rubocop:disable Metrics/MethodLength
    def string_enum(pairs)
      pairs.each do |name, values|
        values.each do |value|
          snake_case_value = value.tr(' ', '_')

          class_eval <<-RUBY
            const_set("#{name.upcase}_#{snake_case_value.upcase}", '#{value}')

            def #{snake_case_value}?
              string_enum_check_value?(:#{name}, '#{value}')
            end

            def mark_#{snake_case_value}
              string_enum_write_value(:#{name}, '#{value}')
            end
          RUBY
        end
      end
    end
  end

  private

  def string_enum_check_value?(status_attribute_name, value)
    status = send(status_attribute_name)
    status.present? && status == value
  end

  def string_enum_write_value(status_attribute_name, value)
    send("#{status_attribute_name}=", value)
  end
end
