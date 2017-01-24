require 'rails_helper'

feature 'Visitor view jobs on home page' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    Job.create(title: 'Vaga de Dev',
               category: category,
               company: company,
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo')

    visit root_path

    expect(page).to have_content('Vaga de Dev')
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('São Paulo')
    expect(page).not_to have_content('Destaque')
  end

  scenario 'and view a list of jobs' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
               category: category,
               company: company,
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo')

    another_job = Job.create(title: 'UX Senior',
                             company: company,
                             category: category,
                             description: 'UX com experiência em redes sociais',
                             location: 'São Paulo',
                             featured: true)
    visit root_path

    expect(page).to have_css('h1',text: job.title)
    expect(page).to have_content(job.company.name)
    expect(page).not_to have_content(job.description)
    expect(page).to have_css('h1',text: another_job.title)
    expect(page).to have_content(another_job.company.name)
    expect(page).to have_css('strong', text: 'Destaque')
    expect(page).not_to have_content(another_job.description)
  end
end
