describe Space do
  it "requires a User to create a space" do
    new_space = Space.create(name: "Wonderland",
                          description: "Your Body",
                          rate: "1",
                          max_capacity: "2",
                          available_from_date: "30/2/1988",
                          available_to_date: "21/5/2017")
    expect(Space.first).to eq nil
  end
end
