require 'rails_helper'

describe 'Users API' do
  before(:each) do
    @user = {
      'email': 'whatever@example.com',
      'password': '123',
      'password_confirmation': '123'
    }

    @user2 = {
      "email": 'WhatEver@example.com',
      "password": '123',
      "password_confirmation": '123'
    }

    @user3 = {
      "email": 'whatever@example.com',
      "password": 'hello',
      "password_confirmation": '123'
    }

    @user4 = {
      "email": '',
      "password": 'password',
      "password_confirmation": 'password'
    }
  end

  it 'can create a user' do
    post '/api/v1/users', params: @user.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a Hash
    expect(json).to have_key :data
    expect(json[:data]).to have_key :id
    expect(json[:data][:id]).to_not eq(nil)
    expect(json[:data][:id]).to be_a String
    expected = %i[email api_key]
    expect(json[:data][:attributes].keys).to eq(expected)
    expect(json[:data][:attributes][:email]).to be_a String
    expect(json[:data][:attributes][:api_key]).to be_a String
  end

  it 'can give error messages with taken email' do
    post '/api/v1/users', params: @user.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    post '/api/v1/users', params: @user2.to_json,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json.first).to eq('Email has already been taken')
  end

  it 'can\'t create a user because passwords don\'t match.' do
    post '/api/v1/users', params: @user3.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json.first).to eq("Password confirmation doesn't match Password")
  end

  it 'can\'t have a blank email when creating a user' do
    post '/api/v1/users', params: @user4.to_json,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json.first).to eq("Email can't be blank")
  end
end
