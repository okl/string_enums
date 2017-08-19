require 'spec_helper'

class TesterWithStatus
  include StringEnums
  string_enum the_status: ['pending', 'in progress', 'completed']
  attr_accessor :the_status
end

RSpec.describe StringEnums do
  let(:tester) { TesterWithStatus.new }

  %w(pending in\ progress completed).each do |status_value|
    context "for status #{status_value}" do
      let(:snake_status) { status_value.tr(' ', '_') }
      it 'has checker' do
        expect(tester).to respond_to("#{snake_status}?")
      end

      it 'has constant' do
        constant_name = "THE_STATUS_#{snake_status.upcase}"
        expect(tester.class.const_get(constant_name)).to eq status_value
      end

      it 'has writer' do
        expect(tester).to respond_to("mark_#{snake_status}")
      end

      it 'checker returns true' do
        tester.the_status = status_value
        expect(tester.public_send("#{snake_status}?")).to be_truthy
      end

      it 'checker returns false' do
        tester.the_status = 'another value'
        expect(tester.public_send("#{snake_status}?")).to be_falsey
      end

      it 'writes status' do
        tester.the_status = 'another value'
        tester.public_send("mark_#{snake_status}")
        expect(tester.the_status).to eq status_value
      end
    end
  end
end
