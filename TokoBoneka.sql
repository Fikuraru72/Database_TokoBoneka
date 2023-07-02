/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     08/03/2023 07:18:49                          */
/*==============================================================*/


drop table if exists BONEKA;

drop table if exists HEADERPENJUALAN;

drop table if exists JENISMEMBER;

drop table if exists MEMBER;

drop table if exists MEMILIKI;

drop table if exists PEGAWAI;

/*==============================================================*/
/* Table: BONEKA                                                */
/*==============================================================*/
create table BONEKA
(
   KDBONEKA             char(5) not null,
   NAMABONEKA           varchar(30) not null,
   HARGA                int not null,
   STOCK                int not null,
   primary key (KDBONEKA)
);

/*==============================================================*/
/* Table: HEADERPENJUALAN                                       */
/*==============================================================*/
create table HEADERPENJUALAN
(
   KD_PENJUALAN         char(5) not null,
   KDMEMBER             char(5),
   KDPEGAWAI            char(5),
   TGL_PENJUALAN        datetime not null,
   primary key (KD_PENJUALAN)
);

/*==============================================================*/
/* Table: JENISMEMBER                                           */
/*==============================================================*/
create table JENISMEMBER
(
   KD_JENISMEMBER       char(5) not null,
   JENISMEMBER          varchar(10) not null,
   DISC                 decimal(2,2),
   primary key (KD_JENISMEMBER)
);

/*==============================================================*/
/* Table: MEMBER                                                */
/*==============================================================*/
create table MEMBER
(
   KDMEMBER             char(5) not null,
   KD_JENISMEMBER       char(5),
   NAMAMEMBER           varchar(50) not null,
   TELPMEMBER           int,
   primary key (KDMEMBER)
);

/*==============================================================*/
/* Table: MEMILIKI                                              */
/*==============================================================*/
create table MEMILIKI
(
   KD_PENJUALAN         char(5) not null,
   KDBONEKA             char(5) not null,
   primary key (KD_PENJUALAN, KDBONEKA)
);

/*==============================================================*/
/* Table: PEGAWAI                                               */
/*==============================================================*/
create table PEGAWAI
(
   KDPEGAWAI            char(5) not null,
   NAMAPEGAWAI          varchar(30) not null,
   ALAMATPEGAWAI        varchar(50),
   TELPPEGAWAI          int,
   primary key (KDPEGAWAI)
);

alter table HEADERPENJUALAN add constraint FK_DIMILIKI foreign key (KDMEMBER)
      references MEMBER (KDMEMBER) on delete restrict on update restrict;

alter table HEADERPENJUALAN add constraint FK_TERLIBAT foreign key (KDPEGAWAI)
      references PEGAWAI (KDPEGAWAI) on delete restrict on update restrict;

alter table MEMBER add constraint FK_MELIBATKAN foreign key (KD_JENISMEMBER)
      references JENISMEMBER (KD_JENISMEMBER) on delete restrict on update restrict;

alter table MEMILIKI add constraint FK_MEMILIKI foreign key (KD_PENJUALAN)
      references HEADERPENJUALAN (KD_PENJUALAN) on delete restrict on update restrict;

alter table MEMILIKI add constraint FK_MEMILIKI2 foreign key (KDBONEKA)
      references BONEKA (KDBONEKA) on delete restrict on update restrict;

