require 'rails_helper'

RSpec.describe CsvExportJob, type: :job do
  describe "perform" do
    let(:file_path) { File.join(Rails.root, "tmp", Rails.env, "toto.csv") }
    before do
      File.delete(file_path) if File.exist?(file_path)
    end
    it "exports the csv file" do
      2.times do |i|
        Product.create(name: "Product #{i}", price: i*10, percent_discount: i*10%99)
      end
      CsvExportJob.perform_now(111, Product.all.to_a)

      expect(File).to exist(file_path)
    end
  end
end
