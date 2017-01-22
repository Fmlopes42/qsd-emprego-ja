require 'rails_helper'

feature 'Visitor view jobs on home page' do
  scenario 'successfully' do
    Job.create(title: 'Vaga de Dev',
               category: 'Desenvolvedor',
               company: 'Campus Code',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo')

    visit root_path

    expect(page).to have_content('Vaga de Dev')
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('São Paulo')
    expect(page).not_to have_content('Destaque')
  end

  scenario 'and view a list of jobs' do
    job = Job.create(title: 'Vaga de Dev',
               category: 'Desenvolvedor',
               company: 'Campus Code',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo')

    another_job = Job.create(title: 'UX Senior',
                             category: 'UX',
                             company: 'Facebook',
                             description: 'UX com experiência em redes sociais',
                             location: 'São Paulo',
                             featured: true)
    visit root_path

    expect(page).to have_css('h1',text: job.title)
    expect(page).to have_content(job.company)
    expect(page).not_to have_content(job.description)
    expect(page).to have_css('h1',text: another_job.title)
    expect(page).to have_content(another_job.company)
    expect(page).to have_css('strong', text: 'Destaque')
    expect(page).not_to have_content(another_job.description)
  end
end
