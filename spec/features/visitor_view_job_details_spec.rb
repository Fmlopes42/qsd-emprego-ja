require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
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

    visit root_path

    click_on 'Vaga de Dev'

    expect(page).to have_content job.title
    expect(page).to have_content category.name
    expect(page).to have_content job.company.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end

  scenario 'and return to home' do
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

    visit job_path(job)

    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end
end
