require 'rails_helper'

describe '#index' do
  it 'routes /student to the student controller index action' do
    expect(get: '/student').to route_to(controller: 'student', action: 'index')
  end
end

describe '#create' do
  it 'routes /student to the student controller create action' do
    expect(post: '/student').to route_to(controller: 'student', action: 'create')
  end
end

describe '#new' do
  it 'routes /student to the student controller new action' do
    expect(get: '/student/new').to route_to(controller: 'student', action: 'new')
  end
end

describe '#edit' do
  it 'routes /student to the student controller edit action' do
    expect(get: '/student/id/edit').to route_to(controller: 'student', action: 'edit', id: 'id')
  end
end

describe '#update' do
  it 'routes /student to the student controller update action' do
    expect(put: '/student/id/').to route_to(controller: 'student', action: 'update', id: 'id')
  end
end

describe '#destroy' do
  it 'routes /student to the student controller destroy action' do
    expect(delete: '/student/id/').to route_to(controller: 'student', action: 'destroy', id: 'id')
  end
end
