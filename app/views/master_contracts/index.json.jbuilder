json.array!(@master_contracts) do |master_contract|
  json.extract! master_contract, :id, :contract_label, :body
  json.url master_contract_url(master_contract, format: :json)
end
