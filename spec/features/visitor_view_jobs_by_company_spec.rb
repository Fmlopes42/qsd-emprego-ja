require 'rails_helper'

feature 'Visitor view jobs by company' do
  scenario 'successfully' do
    category = Category.create(name: 'Desenvolvedor')
    category_ux = Category.create(name: 'UX')

    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Dev Master',
                     location: 'Rio de Janeiro',
                     company: company,
                     category: category,
                     description: 'Vaga para Dev Master para Bootcamp Rails')

    another_job = Job.create(title: 'UX Senior',
                             location: 'São Paulo',
                             company: company,
                             category: category_ux,
                             description: 'UX com experiência em redes sociais')

    visit root_path

    click_on company.name

    expect(page).to have_css('h1', text: company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(category.name)

    expect(page).to have_content(another_job.title)
    expect(page).to have_content(category_ux.name)
  end

  scenario 'and view only the company jobs' do
    category = Category.create(name: 'Desenvolvedor')

    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Dev Master',
                     location: 'Rio de Janeiro',
                     company: company,
                     category: category,
                     description: 'Vaga para Dev Master para Bootcamp Rails')


    another_company = Company.create(name: 'Google',
                                     location: 'São Paulo',
                                     mail: 'google@gmail.com.br',
                                     phone: '4444-8888')
    visit root_path

    click_on another_company.name

    expect(page).to have_css('h1', text: another_company.name)
    expect(page).not_to have_content(job.title)
    expect(page).not_to have_content(job.category.name)
  end


  scenario 'view a friendly message' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit root_path

    click_on company.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
