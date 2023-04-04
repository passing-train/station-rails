module Api
  module V1
    class TimeEntriesController < ApiController
      def index
        @time_entries = TimeEntry.all
      end

      # Custom Suggest a specific time_entry GET request
      def suggest
        @suggests = TimeEntry.where("entry_text LIKE ?", "%" + params[:q] + "%").pluck(:entry_text).uniq
        if @suggests
          render json: {suggests: @suggests}, state: :ok
        else
          render json: {message: "No TimeEntries could not be found"}, status: :bad_request
        end

      end

      def create
        time_entry = TimeEntry.new(time_entry_params)

        if time_entry.save
          render json: {status: "SUCCESS", message: "TimeEntry was created successfully!", data: time_entry}, status: :created
        else
          render json: time_entry.errors, status: :unprocessable_entity
        end
      end

      # Show a specific time_entry GET request
      def show
        time_entry = TimeEntry.find(params[:id])

        if time_entry
          render json: {data: time_entry}, state: :ok
        else
          render json: {message: "TimeEntry could not be found"}, status: :bad_request
        end
      end

      # Delete a specific time_entry DELETE request
      def destroy
        time_entry = TimeEntry.find(params[:id])

        if time_entry.destroy!
          render json: {message: "TimeEntry was deleted successfully"}, status: :ok
        else
          render json: {message: "TimeEntry does not exist"}, status: :bad_request
        end
      end

      # Update details for a specific time_entry. PATCH request
      def update
        time_entry = TimeEntry.find(params[:id])

        if time_entry.update!(time_entry_params)
          render json: {message: "TimeEntry was updated successfully", data: time_entry}, status: :ok
        else
          render json: {message: "TimeEntry cannot be updated"}, status: :unprocessable_entity
        end
      end

      private

      def time_entry_params
        params.require(:time_entry).permit(:entry_text, :project_external_code)
      end
    end
  end
end
