class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]
  skip_before_action :verify_authenticity_token

	def show

	end

	private

	helper_method :current_lesson

	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end

  def require_authorized_for_current_lesson
    if current_lesson.section.course.user != current_user
      redirect_to root_path, alert: 'You are not currently enrolled in this the course. Please enroll to gain access to the lesson content.'
    end
  end
end
