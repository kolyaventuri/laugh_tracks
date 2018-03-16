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

    paul = Comedian.create(name: "Paul Mooney", age: 76)
    Special.create(name: "Know Your History", comedian_id: paul.id)
    Special.create(name: "Paul Mooney", comedian_id: paul.id)

    al = Comedian.create(name: "Al Madrigal", age: 46)
    Special.create(name: "Why is Rabbit Crying", comedian_id: al.id)
  end

  context 'navigates to /comedians' do
    it 'should display a list of comedians' do
      visit '/comedians'

      within('#comedians') do
        within('tbody') do
          expect(all('tr').length).to be(4)

          within(all('tr').first) do
            tds = all('td')
            expect(tds.first).to have_content('Iliza Shlesinger')
            expect(tds[1]).to have_content('34')
          end
        end
      end
    end

    it 'should display the comedians specials' do
      visit '/comedians'

      within('#comedians tbody tr:first-child td:last-child') do
        expect(find('ul')).to have_content('War Paint')
        expect(find('ul')).to have_content('Freezing Hot')
      end
    end

    it 'should display the average age for all comedians' do
      visit '/comedians'

      expect(page).to have_content('Average Age: 47.5')
    end

    it 'should be able to only display comedians with a certain age' do
      visit '/comedians?age=34'

      within('#comedians') do
        within('tbody') do
          expect(all('tr').length).to be(2)

          all('tr').each do |tr|
            within(tr) do
              tds = all('td')
              expect(tds[1]).to have_content('34')
            end
          end

        end
      end

      visit '/comedians?age=76'

      within('#comedians') do
        within('tbody') do
          expect(all('tr').length).to be(1)

          all('tr').each do |tr|
            within(tr) do
              tds = all('td')
              expect(tds[1]).to have_content('76')
            end
          end

        end
      end
    end
  end
end
