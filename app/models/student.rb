require 'json'
require 'net/http'

class Student < ApplicationRecord
  has_many :subjects

  validates :name, presence: true
  validates :email, presence: true

  def study
    puts 'i m student'
  end

  def self.students
    url = URI.parse('http://dummy.restapiexample.com/api/v1/employees')
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    JSON.parse(response.read_body, symbolize_names: true)
  end
end
