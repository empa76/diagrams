def expect_response_to_be_success
  expect(response.status).to eq(200)
end

def expect_response_to_be_created
  expect(response.status).to eq(201)
end

def expect_response_to_be_bad_request
  expect(response.status).to eq(400)
end

def expect_response_to_be_unauthorized
  expect(response.status).to eq(401)
end

def expect_response_to_be_not_found
  expect(response.status).to eq(404)
end

def expect_response_to_be_unprocessable
  expect(response.status).to eq(422)
end
