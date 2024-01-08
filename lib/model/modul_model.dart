import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModul {
  final String taskName;
  final String taskDesc;
  final Timestamp timestamp;
  final String pitch;
  final String column;
  final String row;
  final String widthmodul;
  final String heightmodul;
  final String widthmodulcount;
  final String heightmodulcount;
  final String widthpixels;
  final String heightpixels;
  final String totalwidthpixels;
  final String totalheightpixels;
  final String resolutioncapacity;
  final String totalwidthmeter;
  final String totalheightmeter;
  final String totalwidthmm;
  final String totalheightmm;
  final String stdratiowidth;
  final String stdratioheight;
  final String modulcount;
  final String psu;
  final String rc;
  final String totalpowers;
  final String averagepowers;
  final String averagepowers2;
  final String arus;
  final String luaspenampangkabellistrik;
  final String tarikankabellanbulat;
  final String msd600count;
  final String msd300count;
  final String processor;
  final String processoralt;

  ItemModul(
    this.taskName,
    this.taskDesc,
    this.timestamp,
    this.pitch,
    this.column,
    this.row,
    this.widthmodul,
    this.heightmodul,
    this.widthmodulcount,
    this.heightmodulcount,
    this.widthpixels,
    this.heightpixels,
    this.totalwidthpixels,
    this.totalheightpixels,
    this.resolutioncapacity,
    this.totalwidthmeter,
    this.totalheightmeter,
    this.totalwidthmm,
    this.totalheightmm,
    this.stdratiowidth,
    this.stdratioheight,
    this.modulcount,
    this.psu,
    this.rc,
    this.totalpowers,
    this.averagepowers,
    this.averagepowers2,
    this.arus,
    this.luaspenampangkabellistrik,
    this.tarikankabellanbulat,
    this.msd600count,
    this.msd300count,
    this.processor,
    this.processoralt,
  );
}
