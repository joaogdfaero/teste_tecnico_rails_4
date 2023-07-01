require 'spec_helper'

describe Api::V1::NetflixesController, type: :controller do
  describe "IMPORT_CSV" do
    let(:csv_file) { fixture_file_upload('path/to/csv/file.csv', 'text/csv') }

    it "imports CSV successfully" do
      post :import_csv, params: { csv: csv_file }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({ "first_message" => "Arquivo CSV importado com sucesso!" })
    end

    it "handles errors during CSV import" do
      # Prepare a CSV file that contains invalid data for testing error handling
      invalid_csv_file = fixture_file_upload('path/to/invalid/csv/file.csv', 'text/csv')

      post :import_csv, params: { csv: invalid_csv_file }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include("first_message")
      # Add additional expectations for the error handling response if needed
    end
  end
end


