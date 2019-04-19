require 'rails_helper'

RSpec.describe FeatureRequest, type: :model do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:issue_attributes) do
    {
      user: user,
      product: product,
      title: 'XX 機能がほしい',
      description: 'XX 機能とは...',
    }
  end

  let(:feature_request_attributes) do
    {
      sponser: 'XX 社',
    }
  end

  describe 'Create' do
    it do
      FeatureRequest.create(
        **issue_attributes,
        **feature_request_attributes,
      )

      expect(Issue.last).to have_attributes(issue_attributes)
      expect(FeatureRequest.last).to have_attributes(feature_request_attributes)
    end
  end

  describe 'Read Attributes' do
    it do
      feature_request = FeatureRequest.create(
        **issue_attributes,
        **feature_request_attributes,
      )

      expect(feature_request).to have_attributes(
        **issue_attributes,
        **feature_request_attributes,
      )
    end
  end

  describe 'Write Attributes' do
    it do
      feature_request = FeatureRequest.create(
        **issue_attributes,
        **feature_request_attributes,
      )

      feature_request.title = 'YY 機能がほしい'
      feature_request.sponser = 'YY 社'

      expect(feature_request).to have_attributes(
        **issue_attributes,
        **feature_request_attributes,
        title: 'YY 機能がほしい',
        sponser: 'YY 社',
      )
    end
  end

  describe 'Query' do
    it do
      feature_request = FeatureRequest.create(
        **issue_attributes,
        **feature_request_attributes,
      )

      requests = FeatureRequest.find_by(title: 'XX 機能がほしい')
      expect(requests).to eq(feature_request)
    end
  end
end
