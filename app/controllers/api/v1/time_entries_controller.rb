module Api
  module V1
    class TimeEntriesController < ApiController
      def index
        @time_entries = TimeEntry.all
      end

      def create
        time_entry = TimeEntry.new(time_entry_params)

        if time_entry.save
          render json: {status: "SUCCESS", message: "TimeEntry was created successfully!", data: time_entry}, status: :created
        else
          render json: time_entry.errors, status: :unprocessable_entity
        end
      end

      private

      def time_entry_params
        params.require(:time_entry).permit(:entry_text, :project_external_code)
      end
    end
  end
end
