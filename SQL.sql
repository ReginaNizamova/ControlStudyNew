USE [master]
GO
/****** Object:  Database [ControlStudy]    Script Date: 08.06.2022 22:00:46 ******/
CREATE DATABASE [ControlStudy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ControlStudy', FILENAME = N'D:\SQL\ControlStudyDiplom\ControlStudy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'ControlStudy_log', FILENAME = N'D:\SQL\ControlStudyDiplom\ControlStudy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2097152KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ControlStudy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlStudy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlStudy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ControlStudy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ControlStudy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ControlStudy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ControlStudy] SET ARITHABORT OFF 
GO
ALTER DATABASE [ControlStudy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ControlStudy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ControlStudy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ControlStudy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ControlStudy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ControlStudy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ControlStudy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ControlStudy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ControlStudy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ControlStudy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ControlStudy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ControlStudy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ControlStudy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ControlStudy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ControlStudy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ControlStudy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ControlStudy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ControlStudy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ControlStudy] SET  MULTI_USER 
GO
ALTER DATABASE [ControlStudy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ControlStudy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ControlStudy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ControlStudy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ControlStudy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ControlStudy] SET QUERY_STORE = OFF
GO
USE [ControlStudy]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 08.06.2022 22:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[IdDiscipline] [int] IDENTITY(1,1) NOT NULL,
	[Discipline] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[IdDiscipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 08.06.2022 22:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[IdGroup] [int] IDENTITY(1,1) NOT NULL,
	[Group] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[IdGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 08.06.2022 22:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[IdPerson] [int] IDENTITY(1,1) NOT NULL,
	[Family] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Patronimic] [varchar](100) NOT NULL,
	[IdGroup] [int] NOT NULL,
	[LoginUser] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[IdPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress]    Script Date: 08.06.2022 22:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[IdProgress] [int] IDENTITY(1,1) NOT NULL,
	[IdPerson] [int] NOT NULL,
	[IdDiscipline] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[DateGrade] [date] NOT NULL,
	[Semester] [int] NOT NULL,
 CONSTRAINT [PK_Progress] PRIMARY KEY CLUSTERED 
(
	[IdProgress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 08.06.2022 22:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 08.06.2022 22:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[IdSession] [int] IDENTITY(1,1) NOT NULL,
	[IdPerson] [int] NOT NULL,
	[DateSession] [datetime] NOT NULL,
	[Time] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[IdSession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Discipline] ON 

INSERT [dbo].[Discipline] ([IdDiscipline], [Discipline]) VALUES (1, N'Математика')
INSERT [dbo].[Discipline] ([IdDiscipline], [Discipline]) VALUES (2, N'Английский язык')
INSERT [dbo].[Discipline] ([IdDiscipline], [Discipline]) VALUES (3, N'Французский язык')
INSERT [dbo].[Discipline] ([IdDiscipline], [Discipline]) VALUES (4, N'Экономика')
INSERT [dbo].[Discipline] ([IdDiscipline], [Discipline]) VALUES (5, N'Философия')
SET IDENTITY_INSERT [dbo].[Discipline] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([IdGroup], [Group]) VALUES (6, N' ')
INSERT [dbo].[Group] ([IdGroup], [Group]) VALUES (1, N'115')
INSERT [dbo].[Group] ([IdGroup], [Group]) VALUES (2, N'215')
INSERT [dbo].[Group] ([IdGroup], [Group]) VALUES (3, N'315')
INSERT [dbo].[Group] ([IdGroup], [Group]) VALUES (4, N'415')
INSERT [dbo].[Group] ([IdGroup], [Group]) VALUES (5, N'515')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (40, N'Артемов', N'Матвей', N'Романович', 6, N'Admin', N'Admin5++', 3)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (41, N'Николаева', N'Анна', N'Викторовна', 6, N'Teacher', N'Teacher5++', 2)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (66, N'Лебедев', N'Андрей', N'Демидович', 1, N'Stud115+1', N'Stud115+1', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (67, N'Орлова', N'Анастасия', N'Максимовна', 1, N'Stud115+2', N'Stud115+2', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (68, N'Титов', N'Демид ', N'Даниилович', 1, N'Stud115+3', N'Stud115+3', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (69, N'Рогова', N'Маргарита ', N'Михайловна', 1, N'Stud115+4', N'Stud115+4', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (70, N'Миронова ', N'Ева ', N'Михайловна', 1, N'Stud115+5', N'Stud115+5', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (71, N'Федоров ', N'Макар ', N'Тимофеевич', 1, N'Stud115+6', N'Stud115+6', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (72, N'Любимова ', N'Антонина ', N'Тимофеевна', 1, N'Stud115+7', N'Stud115+7', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (73, N'Соловьев ', N'Леонид ', N'Эмильевич', 1, N'Stud115+8', N'Stud115+8', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (74, N'Богданова', N'Арина', N'Александровна', 2, N'Stud215+1', N'Stud215+1', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (75, N'Шестаков ', N'Артём ', N'Романович', 2, N'Stud215+2', N'Stud215+2', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (76, N'Токарева ', N'Алия', N'Давидовна', 2, N'Stud215+3', N'Stud215+3', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (77, N'Федоров ', N'Арсений ', N'Дамирович', 2, N'Stud215+4', N'Stud215+4', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (78, N'Максимова ', N'Мария ', N'Владимировна', 2, N'Stud215+5', N'Stud215+5', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (79, N'Сафонова ', N'Арина ', N'Макаровна', 2, N'Stud215+6', N'Stud215+6', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (80, N'Александров ', N'Михаил ', N'Семёнович', 2, N'Stud215+7', N'Stud215+7', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (82, N'Авдеева ', N'Полина ', N'Михайловна', 2, N'Stud215+8', N'Stud215+8', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (84, N'Лукьянов ', N'Константин ', N'Сергеевич', 3, N'Stud315+1', N'Stud315+1', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (85, N'Егоров ', N'Глеб ', N'Тимурович', 3, N'Stud315+2', N'Stud315+2', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (86, N'Миронова ', N'Мария ', N'Максимовна', 3, N'Stud315+3', N'Stud315+3', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (87, N'Чижова ', N'Виктория ', N'Юрьевна', 3, N'Stud315+4', N'Stud315+4', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (88, N'Большакова ', N'Валентина ', N'Яковлевна', 3, N'Stud315+5', N'Stud315+5', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (89, N'Муратова ', N'Александра ', N'Тимуровна', 4, N'Stud415+1', N'Stud415+1', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (90, N'Ситникова ', N'Юлия ', N'Михайловна', 4, N'Stud415+2', N'Stud415+2', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (91, N'Глушкова ', N'Полина ', N'Михайловна', 4, N'Stud415+3', N'Stud415+3', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (92, N'Емельянов ', N'Дмитрий ', N'Леонидович', 4, N'Stud415+4', N'Stud415+4', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (93, N'Ермаков ', N'Ярослав ', N'Николаевич', 5, N'Stud515+1', N'Stud515+1', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (94, N'Григорьева ', N'Алиса ', N'Дмитриевна', 5, N'Stud515+2', N'Stud515+2', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (95, N'Спиридонов ', N'Александр ', N'Романович', 5, N'Stud515+3', N'Stud515+3', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (96, N'Матвеева ', N'Ольга ', N'Тимофеевна', 5, N'Stud515+4', N'Stud515+4', 1)
INSERT [dbo].[Person] ([IdPerson], [Family], [Name], [Patronimic], [IdGroup], [LoginUser], [Password], [IdRole]) VALUES (97, N'Тихомиров ', N'Дмитрий ', N'Юрьевич', 5, N'Stud515+5', N'Stud515+5', 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Progress] ON 

INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (26, 66, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (27, 66, 2, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (28, 66, 3, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (29, 66, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (30, 66, 5, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (31, 67, 1, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (32, 67, 2, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (33, 67, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (34, 67, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (35, 67, 5, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (36, 66, 1, 4, CAST(N'2022-05-31' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (37, 68, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (38, 68, 2, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (39, 68, 4, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (40, 69, 3, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (41, 69, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (42, 70, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (43, 70, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (44, 72, 1, 2, CAST(N'2022-06-07' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (45, 93, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (46, 96, 1, 4, CAST(N'2022-05-30' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (47, 84, 4, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (48, 70, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (49, 89, 2, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (50, 90, 2, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (51, 91, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (52, 92, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (53, 78, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (54, 79, 2, 5, CAST(N'2022-06-01' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (55, 80, 2, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (56, 90, 1, 4, CAST(N'2022-06-02' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (57, 88, 1, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (58, 78, 4, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (59, 91, 5, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (60, 70, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (61, 73, 1, 2, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (62, 71, 2, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (63, 72, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (64, 69, 4, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (65, 68, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (66, 74, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (67, 74, 2, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (68, 74, 3, 2, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (69, 74, 4, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (70, 74, 5, 2, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (71, 75, 1, 2, CAST(N'2022-06-01' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (72, 75, 2, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (73, 75, 3, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (74, 75, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (75, 75, 5, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (76, 76, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (77, 76, 2, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (78, 76, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (79, 71, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (80, 89, 1, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (81, 89, 2, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (82, 89, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (83, 89, 5, 4, CAST(N'2022-06-06' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (84, 90, 3, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (85, 92, 4, 4, CAST(N'2022-06-07' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (86, 95, 1, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (87, 94, 1, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (88, 96, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (89, 97, 1, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (90, 96, 2, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (91, 96, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (92, 95, 4, 3, CAST(N'2022-06-03' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (93, 93, 4, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (94, 90, 5, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (95, 97, 2, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (96, 84, 1, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (97, 85, 1, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (98, 70, 1, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (99, 87, 1, 2, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (100, 88, 1, 3, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (101, 84, 2, 4, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (102, 70, 2, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (103, 87, 4, 5, CAST(N'2022-06-08' AS Date), 2)
INSERT [dbo].[Progress] ([IdProgress], [IdPerson], [IdDiscipline], [Grade], [DateGrade], [Semester]) VALUES (104, 85, 5, 4, CAST(N'2022-06-08' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Progress] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRole], [Role]) VALUES (1, N'Студент')
INSERT [dbo].[Roles] ([IdRole], [Role]) VALUES (2, N'Преподаватель')
INSERT [dbo].[Roles] ([IdRole], [Role]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([IdSession], [IdPerson], [DateSession], [Time]) VALUES (7, 40, CAST(N'2022-06-08T20:59:51.273' AS DateTime), N'0:0:37')
INSERT [dbo].[Session] ([IdSession], [IdPerson], [DateSession], [Time]) VALUES (8, 41, CAST(N'2022-06-08T21:59:38.733' AS DateTime), N'0:1:7')
INSERT [dbo].[Session] ([IdSession], [IdPerson], [DateSession], [Time]) VALUES (20, 66, CAST(N'2022-06-08T21:46:10.707' AS DateTime), N'0:0:29')
INSERT [dbo].[Session] ([IdSession], [IdPerson], [DateSession], [Time]) VALUES (21, 67, CAST(N'2022-06-08T21:03:59.000' AS DateTime), N'0:0:21')
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Group__D38B86594DAAB360]    Script Date: 08.06.2022 22:00:46 ******/
ALTER TABLE [dbo].[Group] ADD UNIQUE NONCLUSTERED 
(
	[Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Group] FOREIGN KEY([IdGroup])
REFERENCES [dbo].[Group] ([IdGroup])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Group]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Roles] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Roles] ([IdRole])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Roles]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_Discipline] FOREIGN KEY([IdDiscipline])
REFERENCES [dbo].[Discipline] ([IdDiscipline])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_Discipline]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_Person] FOREIGN KEY([IdPerson])
REFERENCES [dbo].[Person] ([IdPerson])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_Person]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Person] FOREIGN KEY([IdPerson])
REFERENCES [dbo].[Person] ([IdPerson])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Person]
GO
USE [master]
GO
ALTER DATABASE [ControlStudy] SET  READ_WRITE 
GO
