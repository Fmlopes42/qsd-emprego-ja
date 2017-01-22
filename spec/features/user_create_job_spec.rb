require 'rails_helper'

feature 'User create jobs' do
  scenario 'successfully' do
    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: 'Desenvolvedor',
                  company: 'Campus Code',
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    visit new_job_path

    fill_in 'Título',       with: job.title
    fill_in 'Local',        with: job.location
    fill_in 'Categoria',    with: job.category
    fill_in 'Empresa',      with: job.company
    fill_in 'Descrição',    with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content job.location
    expect(page).to have_content job.category
    expect(page).to have_content job.company
    expect(page).to have_content job.description
  end

  scenario 'and mark as featured' do
    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: 'Desenvolvedor',
                  company: 'Campus Code',
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    visit new_job_path

    fill_in 'Título',       with: job.title
    fill_in 'Local',        with: job.location
    fill_in 'Categoria',    with: job.category
    fill_in 'Empresa',      with: job.company
    fill_in 'Descrição',    with: job.description
    check   'Destaque'

    click_on 'Criar Vaga'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content job.location
    expect(page).to have_content job.category
    expect(page).to have_content job.company
    expect(page).to have_content job.description
    expect(page).to have_css('strong', text: 'Destaque')
  end

end
