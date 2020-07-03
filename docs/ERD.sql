CREATE TABLE `Post` (
  `Id` <type>,
  `Title` <type>,
  `Content` <type>,
  `UserId` <type>,
  `CreatedAt` <type>,
  `UpdatedAt` <type>,
  PRIMARY KEY (`Id`),
  KEY `FK` (`UserId`)
);

CREATE TABLE `FriendShip` (
  `Id` <type>,
  `UserId` <type>,
  `FriendId` <type>,
  `Status` <type>,
  `CreatedAt` <type>,
  `UpdatedAt` <type>,
  PRIMARY KEY (`Id`),
  KEY `FK` (`UserId`, `FriendId`)
);

CREATE TABLE `PostComment` (
  `Id` <type>,
  `UserId` <type>,
  `PostId` <type>,
  `Content` <type>,
  `CreatedAt` <type>,
  `UpdatedAt` <type>,
  PRIMARY KEY (`Id`),
  KEY `FK` (`UserId`, `PostId`)
);

CREATE TABLE `LikeDislike` (
  `Id` <type>,
  `PostId` <type>,
  `UserId` <type>,
  `Status` <type>,
  `CreatedAt` <type>,
  `UpdatedAt` <type>,
  PRIMARY KEY (`Id`),
  KEY `FK` (`PostId`, `UserId`)
);

CREATE TABLE `User` (
  `Id` <type>,
  `Username` <type>,
  `Email` <type>,
  `Password` <type>,
  `Status` <type>,
  `ImageLink` <type>,
  `CreatedAt` <type>,
  `UpdatedAt` <type>,
  PRIMARY KEY (`Id`)
);

