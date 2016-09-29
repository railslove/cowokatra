namespace :reminder do
  desc 'seminds users via slack'
  task slack: :environment do
    User.all.decorate.select { |user| user.calculated_budget < 0 }.each { |user| SlackNotification.new.perform(user.email, user.calculated_budget.abs)  }
  end
end
