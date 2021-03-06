USE [Accountmaster]
GO
/****** Object:  User [sa]    Script Date: 02/01/2017 08:50:58 ******/
CREATE USER [sa] FOR LOGIN [sa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tbl_Type]    Script Date: 02/01/2017 08:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](150) NOT NULL,
 CONSTRAINT [PK_tbl_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MasterType]    Script Date: 02/01/2017 08:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_MasterType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_agent]    Script Date: 02/01/2017 08:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_agent](
	[AgentName] [varchar](150) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_agent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_AreaMaster]    Script Date: 02/01/2017 08:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_AreaMaster](
	[AreaName] [varchar](150) NOT NULL,
	[AgentID] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_AreaMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_daytransaction]    Script Date: 02/01/2017 08:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_daytransaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_date] [datetime] NOT NULL,
	[AeraId] [int] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[Remarks] [varchar](250) NOT NULL,
	[type] [int] NOT NULL,
	[creditdebit] [bit] NOT NULL,
	[decription] [varchar](200) NULL,
	[Cardcollected] [int] NOT NULL,
	[MasterType] [int] NOT NULL,
 CONSTRAINT [PK_tbl_daytransaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Agent_Table_1]    Script Date: 02/01/2017 08:50:56 ******/
ALTER TABLE [dbo].[tbl_AreaMaster]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Table_1] FOREIGN KEY([AgentID])
REFERENCES [dbo].[tbl_agent] ([id])
GO
ALTER TABLE [dbo].[tbl_AreaMaster] CHECK CONSTRAINT [FK_Agent_Table_1]
GO
/****** Object:  ForeignKey [FK_Tr_AreaMaster_1]    Script Date: 02/01/2017 08:50:57 ******/
ALTER TABLE [dbo].[tbl_daytransaction]  WITH CHECK ADD  CONSTRAINT [FK_Tr_AreaMaster_1] FOREIGN KEY([AeraId])
REFERENCES [dbo].[tbl_AreaMaster] ([Id])
GO
ALTER TABLE [dbo].[tbl_daytransaction] CHECK CONSTRAINT [FK_Tr_AreaMaster_1]
GO
