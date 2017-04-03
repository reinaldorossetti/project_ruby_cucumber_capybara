# require 'rspec/expectations'
#
# RSpec::Matchers.define :visual_match do |expected|
#   match do |actual|
#     base_path = File.expand_path(".", Dir.pwd) + '/screenshots/'
#     file_atual = File.join(base_path, 'current_images/') + actual + '.png'
#     file_baseline = File.join(base_path, 'baseline/') + expected + '.png'
#     file_diff = File.join(base_path, 'diffs/') + actual + '_diff_' + expected + '.png'
#     comparison = IMATCHER.compare(file_atual, file_baseline)
#     @score = comparison.score
#     if comparison.match? != true
#       comparison.difference_image.save(file_diff)
#     end
#     expect(comparison.match?).to be true
#   end
#   failure_message_for_should do |actual|
#     "expected that two images are equals, but they are #{@score} different"
#   end
# end
