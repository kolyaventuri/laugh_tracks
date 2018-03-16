describe 'User visits comedians page' do
  before :each do
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
  end

  context 'navigates to /comedians' do
    it 'should display a list of comedians' do
      visit '/comedians'

      within('#comedians') do
        within('tbody') do
          expect(all('tr').length).to be(2)

          within(all('tr').first) do
            tds = all('td')
            expect(tds.first).to have_content('Iliza Shlesinger')
            expect(tds.last).to have_content('34')
          end
        end
      end
    end
  end
end
