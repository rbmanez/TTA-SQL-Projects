-- DELETE DB:
USE db_zoo
DROP DATABASE db_libraryMS

-- CREATE DB:
CREATE DATABASE db_libraryMS
USE db_libraryMS




-- CREATE TABLES:

CREATE TABLE tbl_libraryBranch(
	branchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branchName VARCHAR(50) NOT NULL,
	branchAddress VARCHAR(50) NOT NULL
);
SELECT * FROM tbl_libraryBranch


CREATE TABLE tbl_publisher(
	publisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	publisherAddress VARCHAR(50) NOT NULL,
	publisherPhone VARCHAR(50) NOT NULL
);
SELECT * FROM tbl_publisher


CREATE TABLE tbl_book(
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookTitle VARCHAR(50) NOT NULL,
	publisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisherName) 
);
SELECT * FROM tbl_book


CREATE TABLE tbl_bookAuthor(
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(bookID),
	bookAuthorName VARCHAR(50) NOT NULL
);
SELECT * FROM tbl_bookAuthor


CREATE TABLE tbl_bookCopy(
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(BookID),
	branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_libraryBranch(branchID),
	bookCopyAmount INT NOT NULL
);
SELECT * FROM tbl_bookCopy


CREATE TABLE tbl_borrower(
	borrowerCardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrowerName VARCHAR(50) NOT NULL,
	borrowerAddress VARCHAR(50) NOT NULL,
	borrowerPhone VARCHAR(50) NOT NULL
);
SELECT * FROM tbl_borrower


CREATE TABLE tbl_bookLoan(
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(BookID),
	branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_libraryBranch(branchID),
	borrowerCardNo INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(borrowerCardNo),
	bookLoanDateOut DATE NOT NULL,
	bookLoanDateDue DATE NOT NULL
);
SELECT * FROM tbl_bookLoan




-- INSERT DATA INTO TABLES:

INSERT INTO tbl_libraryBranch
	(branchName, branchAddress)
	VALUES
	('Sharpstown', '123 Sharpstown Street'),
	('Central', '123 Central Street'),
	('Orange Park', '123 Orange Park Street'),
	('D21', '123 D21 Street')
;
SELECT * FROM tbl_libraryBranch


INSERT INTO tbl_publisher
	(publisherName, publisherAddress, publisherPhone)
	VALUES
	('Book Publisher', '123 Book Street', '111-123-4567'),
	('Random Publisher', '123 Random Street', '111-223-4567')
;
SELECT * FROM tbl_publisher


INSERT INTO tbl_book
	(bookTitle, publisherName)
	VALUES
	('The Lost Tribe', 'Random Publisher'),
	('Book 1', 'Random Publisher'),
	('Book 2', 'Random Publisher'),
	('Book 3', 'Random Publisher'),
	('Book 4', 'Random Publisher'),
	('Book 5', 'Random Publisher'),
	('Book 6', 'Random Publisher'),
	('Book 7', 'Random Publisher'),
	('Book 8', 'Random Publisher'),
	('Book 9', 'Random Publisher'),
	('Book 10', 'Book Publisher'),
	('Book 11', 'Book Publisher'),
	('Book 12', 'Book Publisher'),
	('Book 13', 'Book Publisher'),
	('Book 14', 'Book Publisher'),
	('Book 15', 'Book Publisher'),
	('Book 16', 'Book Publisher'),
	('Book 17', 'Book Publisher'),
	('Book 18', 'Book Publisher'),
	('Book 19', 'Book Publisher')
;
SELECT * FROM tbl_book


INSERT INTO tbl_bookAuthor
	(bookID, bookAuthorName)
	VALUES
	(1, 'Author 1'),
	(2, 'Author 1'),
	(3, 'Author 2'),
	(4, 'Author 2'),
	(5, 'Author 3'),
	(6, 'Author 3'),
	(7, 'Author 4'),
	(8, 'Author 4'),
	(9, 'Author 5'),
	(10, 'Author 5'),
	(11, 'Author 6'),
	(12, 'Author 6'),
	(13, 'Author 7'),
	(14, 'Author 7'),
	(15, 'Author 8'),
	(16, 'Author 8'),
	(17, 'Author 9'),
	(18, 'Author 9'),
	(19, 'Stephen King'),
	(20, 'Stephen King')
;
SELECT * FROM tbl_bookAuthor
SELECT * FROM tbl_book


INSERT INTO tbl_bookCopy
	(bookID, branchID, bookCopyAmount)
	VALUES
	(1, 1, 2),
	(2, 1, 2),
	(3, 1, 2),
	(4, 1, 2),
	(5, 1, 2),
	(6, 1, 2),
	(7, 1, 2),
	(8, 1, 2),
	(9, 1, 2),
	(10, 1, 2),
	(11, 2, 2),
	(12, 2, 2),
	(13, 2, 2),
	(14, 2, 2),
	(15, 2, 2),
	(16, 2, 2),
	(17, 2, 2),
	(18, 2, 2),
	(19, 2, 2),
	(20, 2, 2),
	(1, 3, 2),
	(2, 3, 2),
	(3, 3, 2),
	(4, 3, 2),
	(5, 3, 2),
	(6, 3, 2),
	(7, 3, 2),
	(8, 3, 2),
	(9, 3, 2),
	(10, 3, 2),
	(11, 4, 2),
	(12, 4, 2),
	(13, 4, 2),
	(14, 4, 2),
	(15, 4, 2),
	(16, 4, 2),
	(17, 4, 2),
	(18, 4, 2),
	(19, 4, 2),
	(20, 4, 2)
;
SELECT * FROM tbl_bookCopy
SELECT * FROM tbl_book
SELECT * FROM tbl_libraryBranch


INSERT INTO tbl_borrower
	(borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	('Bob A', '11 Summer Street', '123-456-7890'),
	('Bob B', '12 Summer Street', '223-456-7890'),
	('Bob C', '13 Summer Street', '323-456-7890'),
	('Bob D', '14 Summer Street', '423-456-7890'),
	('Bob E', '15 Summer Street', '523-456-7890'),
	('Bob F', '16 Summer Street', '623-456-7890'),
	('Bob G', '17 Summer Street', '723-456-7890'),
	('Bob H', '18 Summer Street', '823-456-7890'),
	('Bob I', '19 Summer Street', '923-456-7890')
;
SELECT * FROM tbl_borrower
SELECT * FROM tbl_bookLoan


INSERT INTO tbl_bookLoan
	(bookID, branchID, borrowerCardNo, bookLoanDateOut, bookLoanDateDue)
	VALUES
	(1, 1, 1, '2019-07-22', '2019-08-12'),
	(2, 1, 1, '2019-07-22', '2019-08-12'),
	(3, 1, 1, '2019-07-22', '2019-08-12'),
	(4, 1, 1, '2019-07-22', '2019-08-12'),
	(5, 1, 1, '2019-07-22', '2019-08-12'),
	(6, 1, 1, '2019-07-22', '2019-08-12'),
	(7, 1, 1, '2019-07-22', '2019-08-12'),
	(8, 1, 1, '2019-07-22', '2019-08-12'),
	(9, 1, 2, '2019-07-22', '2019-08-12'),
	(10, 1, 2, '2019-07-22', '2019-08-12'),
	(11, 2, 2, '2019-07-22', '2019-08-12'),
	(12, 2, 2, '2019-07-22', '2019-08-12'),
	(13, 2, 2, '2019-07-22', '2019-08-12'),
	(14, 2, 2, '2019-07-22', '2019-08-12'),
	(15, 2, 3, '2019-07-22', '2019-08-12'),
	(16, 2, 3, '2019-07-22', '2019-08-12'),
	(17, 2, 3, '2019-07-22', '2019-08-12'),
	(18, 2, 3, '2019-07-22', '2019-08-12'),
	(19, 2, 3, '2019-07-22', '2019-08-12'),
	(20, 2, 3, '2019-07-22', '2019-08-12'),
	(1, 3, 4, '2019-07-22', '2019-08-12'),
	(2, 3, 4, '2019-07-22', '2019-08-12'),
	(3, 3, 4, '2019-07-22', '2019-08-12'),
	(4, 3, 4, '2019-07-22', '2019-08-12'),
	(5, 3, 4, '2019-07-22', '2019-08-12'),
	(6, 3, 4, '2019-07-22', '2019-08-12'),
	(7, 3, 4, '2019-07-22', '2019-08-12'),
	(8, 3, 4, '2019-07-22', '2019-08-12'),
	(9, 3, 5, '2019-07-22', '2019-08-12'),
	(10, 3, 5, '2019-07-22', '2019-08-12'),
	(11, 4, 5, '2019-07-22', '2019-08-12'),
	(12, 4, 5, '2019-07-22', '2019-08-12'),
	(13, 4, 5, '2019-07-22', '2019-08-12'),
	(14, 4, 5, '2019-07-22', '2019-08-12'),
	(15, 4, 6, '2019-07-22', '2019-08-12'),
	(16, 4, 6, '2019-07-22', '2019-08-12'),
	(17, 4, 6, '2019-07-22', '2019-08-12'),
	(18, 4, 6, '2019-07-22', '2019-08-12'),
	(19, 4, 6, '2019-07-22', '2019-08-12'),
	(20, 4, 6, '2019-07-22', '2019-08-12'),
	(1, 1, 7, '2019-07-22', '2019-08-12'),
	(2, 1, 7, '2019-07-22', '2019-08-12'),
	(3, 1, 7, '2019-07-22', '2019-08-12'),
	(4, 1, 7, '2019-07-22', '2019-08-12'),
	(5, 1, 7, '2019-07-22', '2019-08-12'),
	(6, 1, 8, '2019-07-22', '2019-08-12'),
	(7, 1, 8, '2019-07-22', '2019-08-12'),
	(8, 1, 8, '2019-07-22', '2019-08-12'),
	(9, 1, 8, '2019-07-22', '2019-08-12'),
	(10, 1, 8, '2019-07-22', '2019-08-12')
;
SELECT * FROM tbl_bookLoan
SELECT * FROM tbl_bookCopy
SELECT * FROM tbl_borrower




-- STORED PROC 1: How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

CREATE PROC usp_getTitleCopyAmountFromSharpstown
AS
SELECT b.bookTitle 'Book Title:', a.bookCopyAmount '# of Copies in Sharpstown:' FROM tbl_bookCopy a
INNER JOIN tbl_book b ON b.bookID = a.bookID
WHERE b.bookTitle = 'The Lost Tribe' AND a.branchID = 1

EXEC usp_getTitleCopyAmountFromSharpstown

SELECT * FROM tbl_bookCopy
SELECT * FROM tbl_book
SELECT * FROM tbl_libraryBranch


-- STORED PROC 2: How many copies of the book titled "The Lost Tribe" are owned by each library branch?

CREATE PROC usp_getCopyFromAllBranch
AS
SELECT c.bookTitle 'Book Title:', b.branchName 'Branch:', a.bookCopyAmount '# of Copies:' FROM tbl_bookCopy a
INNER JOIN tbl_libraryBranch b ON b.branchID = a.branchID
INNER JOIN tbl_book c ON c.bookID = a.bookID
WHERE c.bookTitle = 'The Lost Tribe'

EXEC usp_getCopyFromAllBranch

SELECT * FROM tbl_bookCopy
SELECT * FROM tbl_book
SELECT * FROM tbl_libraryBranch


-- STORED PROC 3: Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROC usp_getBorrowerNameWithNoLoan
AS
SELECT borrowerName 'Names with No Book Loans:' FROM tbl_borrower
WHERE borrowerCardNo NOT IN (SELECT borrowerCardNo FROM tbl_bookLoan)

EXEC usp_getBorrowerNameWithNoLoan

SELECT * FROM tbl_bookLoan
SELECT * FROM tbl_borrower


-- STORED PROC 4: For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
-- retrieve the book title, the borrower's name, and the borrower's address.

CREATE PROC usp_getInfoForBooksDueTodaySharpstownBranch
AS
SELECT c.bookTitle 'Book Title:', a.borrowerName 'Borrower Name:', a.borrowerAddress 'Address:' FROM tbl_borrower a
INNER JOIN tbl_bookLoan b ON b.borrowerCardNo = a.borrowerCardNo
INNER JOIN tbl_book c ON c.bookID = b.bookID
WHERE b.branchID = 1 AND b.bookLoanDateDue = CAST(GETDATE() AS DATE)

EXEC usp_getInfoForBooksDueTodaySharpstownBranch

SELECT * FROM tbl_book
SELECT * FROM tbl_bookLoan
SELECT * FROM tbl_borrower
SELECT * FROM tbl_libraryBranch


-- STORED PROC 5: For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

CREATE PROC usp_getTotalLoanForEachBranch
AS
SELECT b.branchName 'Branch Name:', COUNT(a.branchID) 'Total Loans:' FROM tbl_bookLoan a
INNER JOIN tbl_libraryBranch b ON b.branchID = a.branchID
GROUP BY b.branchName

EXEC usp_getTotalLoanForEachBranch

SELECT * FROM tbl_libraryBranch
SELECT * FROM tbl_bookLoan


-- STORED PROC 6: Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

CREATE PROC usp_getBorrowerInfoWithOver5Loans
AS
SELECT a.borrowerName 'Name:', a.borrowerAddress 'Address:', COUNT(b.borrowerCardNo) 'Total Loans:' FROM tbl_borrower a
INNER JOIN tbl_bookLoan b ON b.borrowerCardNo = a.borrowerCardNo
GROUP BY a.borrowerName, a.borrowerAddress, b.borrowerCardNo
HAVING COUNT(b.borrowerCardNo) > 5

EXEC usp_getBorrowerInfoWithOver5Loans

SELECT * FROM tbl_borrower
SELECT * FROM tbl_bookLoan


-- STORED PROC 7: For each book authored (or co-authored) by "Stephen King",
-- retrieve the title and the number of copies owned by the library branch whose name is "Central".

CREATE PROC usp_getTitleAndCopiesInCentral
AS
SELECT a.bookTitle 'Book Title:', SUM(b.bookCopyAmount) '# of Copies in Central:' FROM tbl_book a
INNER JOIN tbl_bookCopy b ON b.bookID = a.bookID
INNER JOIN tbl_bookAuthor c ON c.bookID = b.bookID 
WHERE b.branchID = 2 AND c.bookAuthorName = 'Stephen King'
GROUP BY c.bookAuthorName, a.bookTitle

EXEC usp_getTitleAndCopiesInCentral

SELECT * FROM tbl_bookCopy
SELECT * FROM tbl_book
SELECT * FROM tbl_bookAuthor




/*
SELECT * FROM tbl_libraryBranch
SELECT * FROM tbl_publisher
SELECT * FROM tbl_book
SELECT * FROM tbl_bookAuthor
SELECT * FROM tbl_bookCopy
SELECT * FROM tbl_bookLoan
SELECT * FROM tbl_borrower
*/