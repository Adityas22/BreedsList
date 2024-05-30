class BreedsList {
  final Message? message;
  final String? status;

  BreedsList({
    this.message,
    this.status,
  });

  BreedsList.fromJson(Map<String, dynamic> json)
      : message = (json['message'] as Map<String, dynamic>?) != null
            ? Message.fromJson(json['message'] as Map<String, dynamic>)
            : null,
        status = json['status'] as String?;

  Map<String, dynamic> toJson() =>
      {'message': message?.toJson(), 'status': status};
}

class Message {
  final List<dynamic>? affenpinscher;
  final List<dynamic>? african;
  final List<dynamic>? airedale;
  final List<dynamic>? akita;
  final List<dynamic>? appenzeller;
  final List<String>? australian;
  final List<dynamic>? basenji;
  final List<dynamic>? beagle;
  final List<dynamic>? bluetick;
  final List<dynamic>? borzoi;
  final List<dynamic>? bouvier;
  final List<dynamic>? boxer;
  final List<dynamic>? brabancon;
  final List<dynamic>? briard;
  final List<String>? buhund;
  final List<String>? bulldog;
  final List<String>? bullterrier;
  final List<String>? cattledog;
  final List<dynamic>? chihuahua;
  final List<dynamic>? chow;
  final List<dynamic>? clumber;
  final List<dynamic>? cockapoo;
  final List<String>? collie;
  final List<dynamic>? coonhound;
  final List<String>? corgi;
  final List<dynamic>? cotondetulear;
  final List<dynamic>? dachshund;
  final List<dynamic>? dalmatian;
  final List<String>? dane;
  final List<String>? deerhound;
  final List<dynamic>? dhole;
  final List<dynamic>? dingo;
  final List<dynamic>? doberman;
  final List<String>? elkhound;
  final List<dynamic>? entlebucher;
  final List<dynamic>? eskimo;
  final List<String>? finnish;
  final List<String>? frise;
  final List<dynamic>? germanshepherd;
  final List<String>? greyhound;
  final List<dynamic>? groenendael;
  final List<dynamic>? havanese;
  final List<String>? hound;
  final List<dynamic>? husky;
  final List<dynamic>? keeshond;
  final List<dynamic>? kelpie;
  final List<dynamic>? komondor;
  final List<dynamic>? kuvasz;
  final List<dynamic>? labradoodle;
  final List<dynamic>? labrador;
  final List<dynamic>? leonberg;
  final List<dynamic>? lhasa;
  final List<dynamic>? malamute;
  final List<dynamic>? malinois;
  final List<dynamic>? maltese;
  final List<String>? mastiff;
  final List<dynamic>? mexicanhairless;
  final List<dynamic>? mix;
  final List<String>? mountain;
  final List<dynamic>? newfoundland;
  final List<dynamic>? otterhound;
  final List<String>? ovcharka;
  final List<dynamic>? papillon;
  final List<dynamic>? pekinese;
  final List<dynamic>? pembroke;
  final List<String>? pinscher;
  final List<dynamic>? pitbull;
  final List<String>? pointer;
  final List<dynamic>? pomeranian;
  final List<String>? poodle;
  final List<dynamic>? pug;
  final List<dynamic>? puggle;
  final List<dynamic>? pyrenees;
  final List<dynamic>? redbone;
  final List<String>? retriever;
  final List<String>? ridgeback;
  final List<dynamic>? rottweiler;
  final List<dynamic>? saluki;
  final List<dynamic>? samoyed;
  final List<dynamic>? schipperke;
  final List<String>? schnauzer;
  final List<String>? segugio;
  final List<String>? setter;
  final List<dynamic>? sharpei;
  final List<String>? sheepdog;
  final List<dynamic>? shiba;
  final List<dynamic>? shihtzu;
  final List<String>? spaniel;
  final List<String>? spitz;
  final List<String>? springer;
  final List<dynamic>? stbernard;
  final List<String>? terrier;
  final List<dynamic>? tervuren;
  final List<dynamic>? vizsla;
  final List<String>? waterdog;
  final List<dynamic>? weimaraner;
  final List<dynamic>? whippet;
  final List<String>? wolfhound;

  Message({
    this.affenpinscher,
    this.african,
    this.airedale,
    this.akita,
    this.appenzeller,
    this.australian,
    this.basenji,
    this.beagle,
    this.bluetick,
    this.borzoi,
    this.bouvier,
    this.boxer,
    this.brabancon,
    this.briard,
    this.buhund,
    this.bulldog,
    this.bullterrier,
    this.cattledog,
    this.chihuahua,
    this.chow,
    this.clumber,
    this.cockapoo,
    this.collie,
    this.coonhound,
    this.corgi,
    this.cotondetulear,
    this.dachshund,
    this.dalmatian,
    this.dane,
    this.deerhound,
    this.dhole,
    this.dingo,
    this.doberman,
    this.elkhound,
    this.entlebucher,
    this.eskimo,
    this.finnish,
    this.frise,
    this.germanshepherd,
    this.greyhound,
    this.groenendael,
    this.havanese,
    this.hound,
    this.husky,
    this.keeshond,
    this.kelpie,
    this.komondor,
    this.kuvasz,
    this.labradoodle,
    this.labrador,
    this.leonberg,
    this.lhasa,
    this.malamute,
    this.malinois,
    this.maltese,
    this.mastiff,
    this.mexicanhairless,
    this.mix,
    this.mountain,
    this.newfoundland,
    this.otterhound,
    this.ovcharka,
    this.papillon,
    this.pekinese,
    this.pembroke,
    this.pinscher,
    this.pitbull,
    this.pointer,
    this.pomeranian,
    this.poodle,
    this.pug,
    this.puggle,
    this.pyrenees,
    this.redbone,
    this.retriever,
    this.ridgeback,
    this.rottweiler,
    this.saluki,
    this.samoyed,
    this.schipperke,
    this.schnauzer,
    this.segugio,
    this.setter,
    this.sharpei,
    this.sheepdog,
    this.shiba,
    this.shihtzu,
    this.spaniel,
    this.spitz,
    this.springer,
    this.stbernard,
    this.terrier,
    this.tervuren,
    this.vizsla,
    this.waterdog,
    this.weimaraner,
    this.whippet,
    this.wolfhound,
  });

  Message.fromJson(Map<String, dynamic> json)
      : affenpinscher = json['affenpinscher'] as List?,
        african = json['african'] as List?,
        airedale = json['airedale'] as List?,
        akita = json['akita'] as List?,
        appenzeller = json['appenzeller'] as List?,
        australian = (json['australian'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        basenji = json['basenji'] as List?,
        beagle = json['beagle'] as List?,
        bluetick = json['bluetick'] as List?,
        borzoi = json['borzoi'] as List?,
        bouvier = json['bouvier'] as List?,
        boxer = json['boxer'] as List?,
        brabancon = json['brabancon'] as List?,
        briard = json['briard'] as List?,
        buhund =
            (json['buhund'] as List?)?.map((dynamic e) => e as String).toList(),
        bulldog = (json['bulldog'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        bullterrier = (json['bullterrier'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        cattledog = (json['cattledog'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        chihuahua = json['chihuahua'] as List?,
        chow = json['chow'] as List?,
        clumber = json['clumber'] as List?,
        cockapoo = json['cockapoo'] as List?,
        collie =
            (json['collie'] as List?)?.map((dynamic e) => e as String).toList(),
        coonhound = json['coonhound'] as List?,
        corgi =
            (json['corgi'] as List?)?.map((dynamic e) => e as String).toList(),
        cotondetulear = json['cotondetulear'] as List?,
        dachshund = json['dachshund'] as List?,
        dalmatian = json['dalmatian'] as List?,
        dane =
            (json['dane'] as List?)?.map((dynamic e) => e as String).toList(),
        deerhound = (json['deerhound'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        dhole = json['dhole'] as List?,
        dingo = json['dingo'] as List?,
        doberman = json['doberman'] as List?,
        elkhound = (json['elkhound'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        entlebucher = json['entlebucher'] as List?,
        eskimo = json['eskimo'] as List?,
        finnish = (json['finnish'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        frise =
            (json['frise'] as List?)?.map((dynamic e) => e as String).toList(),
        germanshepherd = json['germanshepherd'] as List?,
        greyhound = (json['greyhound'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        groenendael = json['groenendael'] as List?,
        havanese = json['havanese'] as List?,
        hound =
            (json['hound'] as List?)?.map((dynamic e) => e as String).toList(),
        husky = json['husky'] as List?,
        keeshond = json['keeshond'] as List?,
        kelpie = json['kelpie'] as List?,
        komondor = json['komondor'] as List?,
        kuvasz = json['kuvasz'] as List?,
        labradoodle = json['labradoodle'] as List?,
        labrador = json['labrador'] as List?,
        leonberg = json['leonberg'] as List?,
        lhasa = json['lhasa'] as List?,
        malamute = json['malamute'] as List?,
        malinois = json['malinois'] as List?,
        maltese = json['maltese'] as List?,
        mastiff = (json['mastiff'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        mexicanhairless = json['mexicanhairless'] as List?,
        mix = json['mix'] as List?,
        mountain = (json['mountain'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        newfoundland = json['newfoundland'] as List?,
        otterhound = json['otterhound'] as List?,
        ovcharka = (json['ovcharka'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        papillon = json['papillon'] as List?,
        pekinese = json['pekinese'] as List?,
        pembroke = json['pembroke'] as List?,
        pinscher = (json['pinscher'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        pitbull = json['pitbull'] as List?,
        pointer = (json['pointer'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        pomeranian = json['pomeranian'] as List?,
        poodle =
            (json['poodle'] as List?)?.map((dynamic e) => e as String).toList(),
        pug = json['pug'] as List?,
        puggle = json['puggle'] as List?,
        pyrenees = json['pyrenees'] as List?,
        redbone = json['redbone'] as List?,
        retriever = (json['retriever'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        ridgeback = (json['ridgeback'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        rottweiler = json['rottweiler'] as List?,
        saluki = json['saluki'] as List?,
        samoyed = json['samoyed'] as List?,
        schipperke = json['schipperke'] as List?,
        schnauzer = (json['schnauzer'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        segugio = (json['segugio'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        setter =
            (json['setter'] as List?)?.map((dynamic e) => e as String).toList(),
        sharpei = json['sharpei'] as List?,
        sheepdog = (json['sheepdog'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        shiba = json['shiba'] as List?,
        shihtzu = json['shihtzu'] as List?,
        spaniel = (json['spaniel'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        spitz =
            (json['spitz'] as List?)?.map((dynamic e) => e as String).toList(),
        springer = (json['springer'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        stbernard = json['stbernard'] as List?,
        terrier = (json['terrier'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        tervuren = json['tervuren'] as List?,
        vizsla = json['vizsla'] as List?,
        waterdog = (json['waterdog'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        weimaraner = json['weimaraner'] as List?,
        whippet = json['whippet'] as List?,
        wolfhound = (json['wolfhound'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'affenpinscher': affenpinscher,
        'african': african,
        'airedale': airedale,
        'akita': akita,
        'appenzeller': appenzeller,
        'australian': australian,
        'basenji': basenji,
        'beagle': beagle,
        'bluetick': bluetick,
        'borzoi': borzoi,
        'bouvier': bouvier,
        'boxer': boxer,
        'brabancon': brabancon,
        'briard': briard,
        'buhund': buhund,
        'bulldog': bulldog,
        'bullterrier': bullterrier,
        'cattledog': cattledog,
        'chihuahua': chihuahua,
        'chow': chow,
        'clumber': clumber,
        'cockapoo': cockapoo,
        'collie': collie,
        'coonhound': coonhound,
        'corgi': corgi,
        'cotondetulear': cotondetulear,
        'dachshund': dachshund,
        'dalmatian': dalmatian,
        'dane': dane,
        'deerhound': deerhound,
        'dhole': dhole,
        'dingo': dingo,
        'doberman': doberman,
        'elkhound': elkhound,
        'entlebucher': entlebucher,
        'eskimo': eskimo,
        'finnish': finnish,
        'frise': frise,
        'germanshepherd': germanshepherd,
        'greyhound': greyhound,
        'groenendael': groenendael,
        'havanese': havanese,
        'hound': hound,
        'husky': husky,
        'keeshond': keeshond,
        'kelpie': kelpie,
        'komondor': komondor,
        'kuvasz': kuvasz,
        'labradoodle': labradoodle,
        'labrador': labrador,
        'leonberg': leonberg,
        'lhasa': lhasa,
        'malamute': malamute,
        'malinois': malinois,
        'maltese': maltese,
        'mastiff': mastiff,
        'mexicanhairless': mexicanhairless,
        'mix': mix,
        'mountain': mountain,
        'newfoundland': newfoundland,
        'otterhound': otterhound,
        'ovcharka': ovcharka,
        'papillon': papillon,
        'pekinese': pekinese,
        'pembroke': pembroke,
        'pinscher': pinscher,
        'pitbull': pitbull,
        'pointer': pointer,
        'pomeranian': pomeranian,
        'poodle': poodle,
        'pug': pug,
        'puggle': puggle,
        'pyrenees': pyrenees,
        'redbone': redbone,
        'retriever': retriever,
        'ridgeback': ridgeback,
        'rottweiler': rottweiler,
        'saluki': saluki,
        'samoyed': samoyed,
        'schipperke': schipperke,
        'schnauzer': schnauzer,
        'segugio': segugio,
        'setter': setter,
        'sharpei': sharpei,
        'sheepdog': sheepdog,
        'shiba': shiba,
        'shihtzu': shihtzu,
        'spaniel': spaniel,
        'spitz': spitz,
        'springer': springer,
        'stbernard': stbernard,
        'terrier': terrier,
        'tervuren': tervuren,
        'vizsla': vizsla,
        'waterdog': waterdog,
        'weimaraner': weimaraner,
        'whippet': whippet,
        'wolfhound': wolfhound
      };
}
