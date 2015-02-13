# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tale.create(
  {
    inspiration: 'your mom', 
    story_type: 'word', 
    public_access: true,
    content: 'Once upon a time',
    title: 'A pretty lady'
  },
  {
    inspiration: 'your mom 2', 
    story_type: 'word', 
    public_access: false,
    content: 'Once upon a time',
    title: 'A lady'
  },
   {
    inspiration: 'your mom 3', 
    story_type: 'sentence', 
    public_access: true,
    content: 'Once upon a time',
    title: 'Ahhhhh lady'
  },
  {
    inspiration: 'your mom 4', 
    story_type: 'sentence', 
    public_access: true,
    content: 'Once upon a time',
    title: 'The sneeze'
  }
)

