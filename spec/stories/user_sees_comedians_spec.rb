describe 'User visits comedians page' do
  context 'navigates to /comedians' do
    it 'should display a list of comedians' do
      visit '/comedians'

      within('#comedians') do
        within('tbody') do
          expect(all('tr').length).to be(11)

          within(all('tr').first) do
            tds = all('tr:first-child td')
            expect(tds.first).to have_content('Iliza Shlesinger')
            expect(tds.last).to have_content('34')
          end
        end
      end
    end
  end
end
