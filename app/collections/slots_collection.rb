class SlotsCollection
  attr_reader :params

  def initialize(relation, params)
    @relation = relation
    @params = params
  end

  def call
    filter_by_created_between if params.dig(:open_time).present? && params.dig(:close_time).present?
    filter_by_claim_type if params.dig(:features).present?
    @relation
  end

  private

  def filter
    @relation = yield(@relation)
  end

  def filter_by_created_between
    filter { @relation.filter_by_date_and_time(params.dig(:open_time), params.dig(:close_time)) }
  end

  def filter_by_claim_type
    filter { @relation.filter_by_features(params.dig(:features)) }
  end
end
