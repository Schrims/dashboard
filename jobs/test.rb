start_time = Time.new
start_time = start_time.min

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2s', :first_in => 0 do |job|
  current_time = Time.new
  current_time = current_time.min
  send_event('up_time', {
    value: current_time - start_time
  })
  send_event('response_time', {
    value: (rand * 600).to_i
  })
end
