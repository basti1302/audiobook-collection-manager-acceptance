#encoding: utf-8

Given /^a cucumber that is (\d+) cm long$/ do |length|
  @cucumber = {:color => 'green', :length => length.to_i}
end

When /^I (?:cut|chop) (?:it|the cucumber) in (?:halves|half|two)$/ do
  @choppedCucumbers = [  
    {:color => @cucumber[:color], :length => @cucumber[:length] / 2},
    {:color => @cucumber[:color], :length => @cucumber[:length] / 2}
  ]
end

Then /^I have two cucumbers$/ do
  @choppedCucumbers.length.should == 2
end

Then /^both are (\d+) cm long$/ do |length|
  @choppedCucumbers.each do |cuke|
    cuke[:length].should == length.to_i
  end
end

