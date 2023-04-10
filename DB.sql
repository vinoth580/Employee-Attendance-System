USE [EmployeeAttendance]
GO
/****** Object:  Table [dbo].[tbl_ApplyLeave]    Script Date: 16-05-2022 12:15:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ApplyLeave](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[LeaveType] [varchar](50) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Description] [varchar](max) NULL,
	[AppliedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_ApplyLeave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AttendanceTime]    Script Date: 16-05-2022 12:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AttendanceTime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[AttendanceDate] [datetime] NULL,
	[CheckInTime] [datetime] NULL,
	[CheckOutTime] [datetime] NULL,
 CONSTRAINT [PK_tbl_AttendanceTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Permission]    Script Date: 16-05-2022 12:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Permission](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[PermissionDate] [datetime] NULL,
	[PermissionHour] [decimal](18, 2) NULL,
	[Reason] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegister]    Script Date: 16-05-2022 12:15:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegister](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[Initial] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[ImagePath] [varchar](max) NULL,
	[Mobileno] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[EmployeeId] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[BloodGroup] [varchar](50) NULL,
	[YearOfJoining] [varchar](50) NULL,
	[FathersName] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Address3] [varchar](50) NULL,
 CONSTRAINT [PK_tblRegister] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_ApplyLeave] ON 
GO
INSERT [dbo].[tbl_ApplyLeave] ([Id], [UserId], [LeaveType], [FromDate], [ToDate], [Description], [AppliedDate]) VALUES (1, 1, N'Fever', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), N'sd', CAST(N'2022-11-05T17:40:02.000' AS DateTime))
GO
INSERT [dbo].[tbl_ApplyLeave] ([Id], [UserId], [LeaveType], [FromDate], [ToDate], [Description], [AppliedDate]) VALUES (3, 2, N'Fever', CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), N'fever', CAST(N'2022-05-16T11:20:18.170' AS DateTime))
GO
INSERT [dbo].[tbl_ApplyLeave] ([Id], [UserId], [LeaveType], [FromDate], [ToDate], [Description], [AppliedDate]) VALUES (4, 1, N'Fever', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), N's', CAST(N'2022-05-16T12:02:13.120' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_ApplyLeave] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_AttendanceTime] ON 
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (1, 1, CAST(N'2022-11-05T17:30:09.000' AS DateTime), CAST(N'2022-11-05T17:30:09.000' AS DateTime), CAST(N'2022-11-05T17:30:09.000' AS DateTime))
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (2, 1, CAST(N'2022-11-05T17:30:11.000' AS DateTime), CAST(N'2022-11-05T17:30:11.000' AS DateTime), CAST(N'2022-11-05T17:30:11.000' AS DateTime))
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (5, 2, CAST(N'2022-05-16T11:15:17.973' AS DateTime), CAST(N'2022-05-16T11:15:18.233' AS DateTime), CAST(N'2022-05-16T11:15:18.723' AS DateTime))
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (6, 2, CAST(N'2022-05-16T11:19:27.050' AS DateTime), CAST(N'2022-05-16T11:19:27.050' AS DateTime), NULL)
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (8, 2, CAST(N'2022-05-16T11:19:42.793' AS DateTime), NULL, CAST(N'2022-05-16T11:19:42.793' AS DateTime))
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (9, 1, CAST(N'2022-05-16T12:01:57.107' AS DateTime), CAST(N'2022-05-16T12:01:57.107' AS DateTime), NULL)
GO
INSERT [dbo].[tbl_AttendanceTime] ([Id], [UserId], [AttendanceDate], [CheckInTime], [CheckOutTime]) VALUES (10, 1, CAST(N'2022-05-16T12:01:59.780' AS DateTime), NULL, CAST(N'2022-05-16T12:01:59.780' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_AttendanceTime] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Permission] ON 
GO
INSERT [dbo].[tbl_Permission] ([Id], [UserId], [PermissionDate], [PermissionHour], [Reason]) VALUES (1, 1, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(3.00 AS Decimal(18, 2)), N'hospital')
GO
INSERT [dbo].[tbl_Permission] ([Id], [UserId], [PermissionDate], [PermissionHour], [Reason]) VALUES (2, 2, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'personal work')
GO
INSERT [dbo].[tbl_Permission] ([Id], [UserId], [PermissionDate], [PermissionHour], [Reason]) VALUES (3, 2, CAST(N'2022-05-26T00:00:00.000' AS DateTime), CAST(2.00 AS Decimal(18, 2)), N'personal')
GO
INSERT [dbo].[tbl_Permission] ([Id], [UserId], [PermissionDate], [PermissionHour], [Reason]) VALUES (4, 1, CAST(N'2022-05-27T00:00:00.000' AS DateTime), CAST(3.00 AS Decimal(18, 2)), N's')
GO
SET IDENTITY_INSERT [dbo].[tbl_Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRegister] ON 
GO
INSERT [dbo].[tblRegister] ([Id], [FirstName], [Initial], [Gender], [EmailId], [Address], [ImagePath], [Mobileno], [UserName], [Password], [EmployeeId], [Department], [DOB], [BloodGroup], [YearOfJoining], [FathersName], [Address1], [Address2], [Address3]) VALUES (1, N'raj', N'Mr.', N'Male', N'raj@gmail.com', N'salem', N'~/images/8pothos.jpg', N'98888888', N'888', N'fe3a', NULL, NULL, N'12/12/18989', N'O+', N'2010', N'ravi', N'salem', N'salem', N'saelm')
GO
INSERT [dbo].[tblRegister] ([Id], [FirstName], [Initial], [Gender], [EmailId], [Address], [ImagePath], [Mobileno], [UserName], [Password], [EmployeeId], [Department], [DOB], [BloodGroup], [YearOfJoining], [FathersName], [Address1], [Address2], [Address3]) VALUES (2, N'vinoth', N'Mr.', N'Male', N'vinoth@gmail.com', N'salem', N'~/images/8pothos.jpg', N'9887676767', N'19235', N'bb57', NULL, NULL, N'15/7/2000', N'B+', N'12/12/2020', N's', N'salem', N'salem', N'salem')
GO
SET IDENTITY_INSERT [dbo].[tblRegister] OFF
GO
