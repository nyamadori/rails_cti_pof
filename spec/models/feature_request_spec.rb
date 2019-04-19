require 'rails_helper'

RSpec.describe FeatureRequest, type: :model do
  describe 'accessor' do
    describe 'self class' do
      let(:feature_request) { create(:feature_request, sponser: 'foo') }

      describe 'getter' do
        it do
          expect(feature_request.sponser).to eq('foo')
        end
      end

      describe 'setter' do
        it do
          feature_request.sponser = 'bar'
          expect(feature_request.sponser).to eq('bar')
        end
      end
    end

    describe 'super class' do
      let(:product) { create(:product) }
      let!(:feature_request) { create(:feature_request, sponser: 'foo', product: product) }

      describe 'getter' do
        it do
          expect(feature_request.description).to eq(feature_request.issue.description)
          expect(feature_request.status).to eq(feature_request.issue.status)
          expect(feature_request.product).to eq(product)
        end
      end

      describe 'setter' do
        let(:new_product) { create(:product) }

        it do
          feature_request.description = 'description'
          expect(feature_request.description).to eq('description')

          feature_request.status = :closed
          expect(feature_request.status).to eq('closed')

          feature_request.opened!
          expect(feature_request.status).to eq('opened')

          feature_request.product = new_product
          expect(feature_request.product).to eq(new_product)
        end
      end
    end
  end

  describe '#new' do
    let(:product) { Product.create(name: 'product') }
    let(:user) { User.create(name: 'user', email: 'test@example.com') }

    subject(:return_value) { FeatureRequest.new(product: product, user: user, status: 'closed', sponser: 'foo') }

    it { is_expected.to have_attributes(sponser: 'foo') }
    it do
      expect(return_value.issue).to have_attributes(status: 'closed', product: product, user: user)
    end
end

  describe 'query' do
    let!(:feature_request_1) { create(:feature_request, status: 'opened', sponser: 'foo') }
    let!(:feature_request_2) { create(:feature_request, status: 'closed', sponser: 'bar') }

    it do
      feature_requests = FeatureRequest.where(status: 'closed', sponser: 'bar')
      expect(feature_requests).to contain_exactly(feature_request_2)
    end
  end
end
