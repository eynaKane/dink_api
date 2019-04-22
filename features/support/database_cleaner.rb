DatabaseCleaner.strategy = :truncation

Spinach.hooks.around_scenario do |&block|
  DatabaseCleaner.cleaning(&block)
end
