require 'rails_helper'

RSpec.describe Debt, type: :model do
  
  context "data entry requirements" do
    subject {
      described_class.new(client:12, reason:"Standard Reason", when: "10-12-2020", amount: 50)
    }
    describe "client" do
      it "must be present" do
        subject.client = nil
        expect(subject).to_not be_valid
        subject.client = 12
        expect(subject).to be_valid
      end

      it "must be integer" do
        subject.client = "ola"
        expect(subject).to_not be_valid
        subject.client = 12
        expect(subject.client).to be_kind_of(Integer)
      end
    end

    describe "when" do
      it "must exist" do
        subject.when = nil
        expect(subject).to_not be_valid
        subject.when = "10-12-2020"
        expect(subject).to be_valid
      end

      it "must be the type of Date" do
        expect(subject.when).to be_kind_of(Date)
      end
    end

    describe "amount" do
      it "must be present" do
        subject.amount = nil
        expect(subject).to_not be_valid
        subject.amount = 50
        expect(subject).to be_valid
      end

      it "must be a float type" do
        subject.amount = "ola"
        expect(subject).to_not be_valid
        subject.amount = 50
        expect(subject.amount).to be_kind_of(Float)
      end

      it "must be greater than zero" do
        subject.amount = -34
        expect(subject).to_not be_valid
      end
    end


  end

end
