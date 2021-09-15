INSERT INTO [Directors] ([DirectorName],[Notes])
VALUES 
('Disney','SOMETHING...'),
('TV7','SOMETHING...'),
('BTV','SOMETHING...'),
('NOVA','SOMETHING...'),
('NOVATV','SOMETHING...')

INSERT INTO [Genres] ([GenreName],[Notes])
VALUES 
('Horror','SOMETHING...'),
('Comedy','SOMETHING...'),
('Trilar','SOMETHING...'),
('Animation','SOMETHING...'),
('Adventoures','SOMETHING...')

INSERT INTO [Categories] ([CategoryName],[Notes])
VALUES 
('Ho','SOMETHING...'),
('Co','SOMETHING...'),
('Tr','SOMETHING...'),
('An','SOMETHING...'),
('Adv','SOMETHING...')


INSERT INTO [Movies] ([Title],[DirectorId],[CopyrightYear]
,[Length],[GenreId],[CategoryId],[Rating],[Notes])
VALUES 
('A1',1,GETDATE(),12.56,1,1,10,'HI'),
('A2',2,GETDATE(),12.56,2,2,20,'HI'),
('A3',3,GETDATE(),12.56,3,3,30,'HI'),
('A4',4,GETDATE(),12.56,4,4,40,'HI'),
('A5',5,GETDATE(),12.56,5,5,50,'HI')
