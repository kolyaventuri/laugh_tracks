describe 'Comedian' do
  it 'can calculate average age of all comedians' do
    iliza = Comedian.create(name: 'Iliza Shlesinger', age: 34)
    Special.create(name: 'War Paint', comedian_id: iliza.id)
    Special.create(name: 'Freezing Hot', comedian_id: iliza.id)
    Special.create(name: 'Confirmed Kills', comedian_id: iliza.id)

    hannibal = Comedian.create(name: 'Hannibal Buress', age: 34)
    Special.create(name: 'My Name is Hannibal', comedian_id: hannibal.id)
    Special.create(name: 'Animal Furnace', comedian_id: hannibal.id)
    Special.create(name: 'Live from Chicago', comedian_id: hannibal.id)
    Special.create(name: 'Comedy Camisado', comedian_id: hannibal.id)
    Special.create(name: 'Hannibal Takes Edinburgh', comedian_id: hannibal.id)

    paul = Comedian.create(name: "Paul Mooney", age: 76)
    Special.create(name: "Know Your History", comedian_id: paul.id)
    Special.create(name: "Paul Mooney", comedian_id: paul.id)

    al = Comedian.create(name: "Al Madrigal", age: 46)
    Special.create(name: "Why is Rabbit Crying", comedian_id: al.id)

    expect(Comedian.average_age).to eq(47.5)
  end
end