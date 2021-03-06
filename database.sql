USE [DB_QandA]
GO
/****** Object:  Table [dbo].[tblSwitchQuestions]    Script Date: 10/11/2017 14:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSwitchQuestions](
	[switchid] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](5000) NOT NULL,
	[levelid] [int] NOT NULL,
 CONSTRAINT [PK_tblSwitchQuestions] PRIMARY KEY CLUSTERED 
(
	[switchid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblSwitchQuestions] ON
INSERT [dbo].[tblSwitchQuestions] ([switchid], [Question], [levelid]) VALUES (1, N'What is 100 + 100', 1)
INSERT [dbo].[tblSwitchQuestions] ([switchid], [Question], [levelid]) VALUES (2, N'Who is the creator of facebook', 2)
INSERT [dbo].[tblSwitchQuestions] ([switchid], [Question], [levelid]) VALUES (3, N'What is 20 + 20', 1)
SET IDENTITY_INSERT [dbo].[tblSwitchQuestions] OFF
/****** Object:  Table [dbo].[tblSwitchAnswer]    Script Date: 10/11/2017 14:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSwitchAnswer](
	[answerid] [int] IDENTITY(1,1) NOT NULL,
	[questionid] [int] NOT NULL,
	[Choices] [varchar](5000) NOT NULL,
	[isCorrect] [int] NOT NULL,
 CONSTRAINT [PK_tblSwitchAnswer_1] PRIMARY KEY CLUSTERED 
(
	[answerid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblSwitchAnswer] ON
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (1, 1, N'200', 1)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (2, 1, N'300', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (3, 1, N'400', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (4, 1, N'500', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (5, 2, N'Mark Zuckerberg', 1)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (6, 2, N'Larry Page', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (7, 2, N'Bill Gates', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (8, 2, N'Agusta Byron', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (9, 3, N'40', 1)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (10, 3, N'50', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (11, 3, N'60', 0)
INSERT [dbo].[tblSwitchAnswer] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (12, 3, N'70', 0)
SET IDENTITY_INSERT [dbo].[tblSwitchAnswer] OFF
/****** Object:  Table [dbo].[tblQuestions]    Script Date: 10/11/2017 14:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuestions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](5000) NOT NULL,
	[levelid] [int] NOT NULL,
 CONSTRAINT [PK_tblQuestions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuestions] ON
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (1, N'What color symbolizes purity?', 1)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (2, N'What is the answer for 1+1?', 1)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (3, N'How many planet do we have?', 1)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (4, N'Fill in the blank, Dont judge a book by its ___________', 1)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (5, N'What is 5 x 5?', 1)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (6, N'PHP stands for?', 2)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (7, N'ASCII stands for?', 2)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (8, N'Who is the father of computing?', 2)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (9, N'First computer we have?', 2)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (10, N'WWW stands for?', 2)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (11, N'What Programming Language that uses Laravel as its framework?', 3)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (12, N'CLI means?', 3)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (13, N'How many computer generatorion we have?', 3)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (14, N'The difference between people with access to computers and the Internet and those without this access is known as the:', 3)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (15, N'________ controls the way in which the computer system functions and provides a means by which users can interact with the computer.', 3)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (16, N' _______ are software which is used to do particular task.', 4)
INSERT [dbo].[tblQuestions] ([id], [Question], [levelid]) VALUES (17, N'The most widely used computer device is.', 4)
SET IDENTITY_INSERT [dbo].[tblQuestions] OFF
/****** Object:  Table [dbo].[tblLevel]    Script Date: 10/11/2017 14:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLevel](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_tblLevel] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblLevel] ON
INSERT [dbo].[tblLevel] ([LevelId], [LevelName], [Amount]) VALUES (1, N'Easy', 5000)
INSERT [dbo].[tblLevel] ([LevelId], [LevelName], [Amount]) VALUES (2, N'Medium', 20000)
INSERT [dbo].[tblLevel] ([LevelId], [LevelName], [Amount]) VALUES (3, N'Hard', 100000)
INSERT [dbo].[tblLevel] ([LevelId], [LevelName], [Amount]) VALUES (4, N'Jackpot', 375000)
SET IDENTITY_INSERT [dbo].[tblLevel] OFF
/****** Object:  Table [dbo].[tblAnswers]    Script Date: 10/11/2017 14:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAnswers](
	[answerid] [int] IDENTITY(1,1) NOT NULL,
	[questionid] [int] NOT NULL,
	[Choices] [varchar](5000) NOT NULL,
	[isCorrect] [int] NOT NULL,
 CONSTRAINT [PK_tblAnswers] PRIMARY KEY CLUSTERED 
(
	[answerid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblAnswers] ON
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (1, 1, N'Red', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (2, 1, N'Blue', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (3, 1, N'White', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (4, 1, N'Orange', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (5, 2, N'1', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (6, 2, N'2', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (7, 2, N'0', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (8, 2, N'3', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (9, 3, N'8', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (10, 3, N'9', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (11, 3, N'7', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (12, 3, N'6', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (13, 4, N'Cover', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (14, 4, N'Use', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (15, 4, N'Reference', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (16, 4, N'Indexes', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (17, 5, N'25', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (18, 5, N'20', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (19, 5, N'15', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (20, 5, N'30', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (21, 6, N'Prehyperprocessor', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (22, 6, N'Hypertext Preprocessor', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (23, 6, N'Processor HyperTextPre', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (24, 6, N'PreProcessor Hypertexr', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (25, 7, N' American Standard Code for Information Interchange', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (26, 7, N' American Standard Code for Information Interchangeable', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (28, 7, N' American Standard Code for Informed Interchange', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (29, 7, N' American Standardized Code for Information Interchange', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (30, 8, N'Charles Babbage', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (31, 8, N'Andrew Lincoln', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (32, 8, N'Agusta Byron', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (33, 8, N'Bill Gates', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (34, 9, N'Abacus', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (35, 9, N'EDVAC', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (36, 9, N'Calculator', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (37, 9, N'SampleComputer', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (38, 10, N'World Wide Wed', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (40, 10, N'World Wide Web', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (41, 10, N'Web World Wide', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (42, 10, N'Wide Web World', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (43, 11, N'C#', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (44, 11, N'PHP', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (45, 11, N'C++', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (46, 11, N'Python', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (47, 12, N'Command Line Interface', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (48, 12, N'Compiler Line Interface', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (49, 12, N'Communicate Linear Interface', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (50, 12, N'Connection Line Interface', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (51, 13, N'5', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (52, 13, N'4', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (53, 13, N'6', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (54, 13, N'7', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (55, 14, N'digital divide', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (56, 14, N'internet divide', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (57, 14, N'cyberway divide', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (58, 14, N'web divide', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (59, 15, N'The Operating System', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (60, 15, N'The Platform', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (61, 15, N'The Motherboard', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (62, 15, N'Application Software', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (63, 16, N'Program', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (64, 16, N'Data', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (65, 16, N'Operating System', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (66, 16, N'Software', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (67, 17, N'External Hard Disk', 1)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (68, 17, N'Mouse', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (69, 17, N'Internal Hard Disk', 0)
INSERT [dbo].[tblAnswers] ([answerid], [questionid], [Choices], [isCorrect]) VALUES (70, 17, N'Solid State disks', 0)
SET IDENTITY_INSERT [dbo].[tblAnswers] OFF
