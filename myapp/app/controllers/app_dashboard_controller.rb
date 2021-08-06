class AppDashboardController < ApplicationController
  def index
  end

  def data
    products_db = Product.all
  end

  def process_data
    CsvExportJob.perform_later(Product.all.to_a)

    redirect_to({ action: "data" }, notice: "Export processing on data")
  end
end
