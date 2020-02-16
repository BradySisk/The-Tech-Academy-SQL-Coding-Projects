USE db_Books

CREATE TABLE tbl_LIBRARY_BRANCH(
	BranchID INT IDENTITY (1,1)  CONSTRAINT PK_BranchID PRIMARY KEY, 
	BranchName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL
	);

CREATE TABLE tbl_Borrower(
	CardNo INT IDENTITY (1,1)  CONSTRAINT PK_CardNo PRIMARY KEY NOT NULL, 
	Name Varchar (50) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(50) NOT NULL
	);

CREATE TABLE tbl_Book_Copies (
	BookID INT  IDENTITY (1,1) CONSTRAINT PK_BookID PRIMARY KEY NOT NULL,
	BranchID INT NOT NULL CONSTRAINT FK_BranchID  FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID),
	Number_of_Copies VARCHAR(50) NOT NULL
	);

CREATE TABLE tbl_Book_Loans (
	BookID INT NOT NULL CONSTRAINT FK_BranchID  FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID),
	BranchID INT NOT NULL CONSTRAINT FK_BranchID  FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID),
	CardNo INT NOT NULL CONSTRAINT FK_BranchID  FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID),
	DateOut VARCHAR (50) NOT NULL,
	DateDue VARCHAR (50) NOT NULL
	);

CREATE TABLE tbl_Books (
	BookID INT  IDENTITY (1,1) CONSTRAINT PK_BookID PRIMARY KEY NOT NULL,
	Title VARCHAR (50) NOT NULL,
	PublisherName VARCHAR (50) NOT NULL
	);

CREATE TABLE tbl_Publisher (
	PublisherName INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Address VARCHAR (50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
	);

CREATE TABLE tbl_Book_Authors (
	 BookID INT NOT NULL CONSTRAINT FK_BookID  FOREIGN KEY REFERENCES tbl_Books(BookID),
	AuthorName VARCHAR (50) NOT NULL
	);

INSERT INTO tbl_LIBRARY_BRANCH
	(BranchID,BranchName,Address)
VALUES 
	('1','Sharpstown','54av'),
	('2','History','88 ct'),
	('3','Astrology','64 dr'),
	('4','Central','21 tr')

INSERT INTO tbl_Books
	(Title,PublisherName)
VALUES
	('The Beautiful Poetry of Donald Trump','Robert Sears'),	
	('How to Analyze People with Psychology',' Emotional Pathway'),
	('Alchemy & Mysticism',',Easton Press')
	('Universe: Exploring the Astronomical World','	Phaidon Press'),
	('Death by Black Hole','Neil deGrasse Tyson'),
	('Chariots of the Gods?','Erich von Däniken'),
	('The Flying Saucers Are Real','Donald Keyhoe'), 
	('The War of the Worlds',' H. G. Wells'),
	('Alien Base: Earths Encounters with Extraterrestrials','Timothy Good'),
	('The Anunnaki Chronicles','Zecharia Sitchin'),
	('The Gods Never Left Us',' Erich von Däniken'),
	('Fingerprints of the Gods','Graham Hancock'),
	('Ancient Aliens and Secret Societies','Mike Bara'), 
	('Magicians of the Gods','Graham Hancock'),
	('Everything You Know Is Wrong : This Disinformation Guide to Secrets and Lies','Disinformation '),
	('This N That','dr.suess'),
	('how to bake ','martha stewart'),
	('high life ','snoop dogg'),
	('abc',',daren'),
	('how to play poker','phil ivy')
INSERT INTO tbl_Book_Authors
	(AuthorName)
VALUES
	('Robert Sears'),
	('Graham Hancock'),
	(' H. G. Wells'),
	(' Emotional Pathway'),
	(' H. G. Wells'),
	('Zecharia Sitchin'),
	('Phaidon Press'),
	('Donald Keyhoe'),
	('Mike Bara'),
	('Neil deGrasse Tyson')

INSERT INTO tbl_Borrower
	(Name,Address,Phone)
VALUES
	('Tony','900 HalfPipe','900'),
	('Brian','290 camelot','817-582-6248'),
	('kevin','170 sracnton Dr','581-582-9645'),
	('Morgana','520 helnva ct','924-985-2544'),
	('Yolanda','869 green st','284-846-4821'),
	('Garen','200 Demacia ct','842-761-7462'),
	('Darius','100 Throne st',''),
	('Lux','325 Demacia ct','526-852-2546'),
	('Syndra','44 Deep blue dr','254-858-3671')

INSERT INTO tbl_Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES 
	('1','Sharpstown','365','11/12/19','11/22/19'),
	('2','History','872','5/19/18','5/28/18'),
	('3','Astrology','446','9/2/14','9/13/14'),
	('4','Central','181','1/1/20','1/11/20'),
	('5','','','',''),


	INSERT INTO tbl_care
		(care_id, care_type, care_specialist)
		VALUES 
		('care_0', 'replace the straw', 1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins', 1),
		('care_3', 'human contact_pet subject', 2),
		('care_4', 'clean up animal waste', 1),
		('care_5', 'move subject to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'extensive dental work', 3)

	There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch.

There is a library branch called 'Sharpstown' and one called 'Central'.

There are at least 20 books in the BOOK table.

There are at least 10 authors in the BOOK_AUTHORS table.

Each library branch has at least 10 book titles, and at least two copies of each of those titles.

There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.

There are at least 4 branches in the LIBRARY_BRANCH table.

There are at least 50 loans in the BOOK_LOANS table.

There must be at least two books written by 'Stephen King' located at the 'Central' branch.

1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

3.) Retrieve the names of all borrowers who do not have any books checked out.

4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

Once you've completed this, add it to your GitHub.

CREATE PROCEDURE dbo.Rowguid @rowguid nvarchar(30) = NULL, @rowguid nvarchar(60) = NULL
AS
SELECT *
FROM person.Address
inner join person.AddressType on person.Address.AddressID = person.Address.rowguid
inner join person.EmailAddress on person.Address.AddressID = Person.Address.rowguid
WHERE Person.Address = ISNULL(@rowguid,rowguid)
AND Person.AddressType LIKE '%' + ISNULL(@rowguid ,rowguid) + '%'
AND Person.EmailAddress LIKE '%' + ISNULL(@rowguid,rowguid) + '%'
GO