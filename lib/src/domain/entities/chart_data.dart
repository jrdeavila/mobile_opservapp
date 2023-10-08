class ChartData {
  dynamic description;
  bool archived;
  dynamic collectionPosition;
  List<OrderedCard> orderedCards;
  dynamic paramValues;
  bool canWrite;
  bool enableEmbedding;
  dynamic collectionId;
  bool showInGettingStarted;
  String name;
  dynamic caveats;
  dynamic collectionAuthorityLevel;
  dynamic creatorId;
  DateTime updatedAt;
  dynamic madePublicById;
  dynamic embeddingParams;
  dynamic cacheTtl;
  List<dynamic> orderedTabs;
  dynamic id;
  dynamic position;
  String entityId;
  dynamic paramFields;
  LastEditInfo lastEditInfo;
  Collection collection;
  List<Parameter> parameters;
  bool autoApplyFilters;
  DateTime createdAt;
  dynamic publicUuid;
  dynamic pointsOfInterest;

  ChartData({
    required this.description,
    required this.archived,
    required this.collectionPosition,
    required this.orderedCards,
    required this.paramValues,
    required this.canWrite,
    required this.enableEmbedding,
    required this.collectionId,
    required this.showInGettingStarted,
    required this.name,
    required this.caveats,
    required this.collectionAuthorityLevel,
    required this.creatorId,
    required this.updatedAt,
    required this.madePublicById,
    required this.embeddingParams,
    required this.cacheTtl,
    required this.orderedTabs,
    required this.id,
    required this.position,
    required this.entityId,
    required this.paramFields,
    required this.lastEditInfo,
    required this.collection,
    required this.parameters,
    required this.autoApplyFilters,
    required this.createdAt,
    required this.publicUuid,
    required this.pointsOfInterest,
  });
}

class Collection {
  dynamic authorityLevel;
  String description;
  bool archived;
  String slug;
  String color;
  String name;
  dynamic personalOwnerId;
  dynamic type;
  int id;
  String entityId;
  String location;
  dynamic namespace;
  DateTime createdAt;

  Collection({
    required this.authorityLevel,
    required this.description,
    required this.archived,
    required this.slug,
    required this.color,
    required this.name,
    required this.personalOwnerId,
    required this.type,
    required this.id,
    required this.entityId,
    required this.location,
    required this.namespace,
    required this.createdAt,
  });
}

class LastEditInfo {
  int id;
  String email;
  String firstName;
  String lastName;
  DateTime timestamp;

  LastEditInfo({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.timestamp,
  });
}

class OrderedCard {
  int sizeX;
  dynamic dashboardTabId;
  List<dynamic> series;
  dynamic actionId;
  dynamic collectionAuthorityLevel;
  Card card;
  DateTime updatedAt;
  int col;
  int id;
  List<dynamic> parameterMappings;
  int cardId;
  String entityId;
  OrderedCardVisualizationSettings visualizationSettings;
  int sizeY;
  int dashboardId;
  DateTime createdAt;
  int row;

  OrderedCard({
    required this.sizeX,
    required this.dashboardTabId,
    required this.series,
    required this.actionId,
    required this.collectionAuthorityLevel,
    required this.card,
    required this.updatedAt,
    required this.col,
    required this.id,
    required this.parameterMappings,
    required this.cardId,
    required this.entityId,
    required this.visualizationSettings,
    required this.sizeY,
    required this.dashboardId,
    required this.createdAt,
    required this.row,
  });
}

class Card {
  dynamic description;
  bool archived;
  dynamic collectionPosition;
  dynamic tableId;
  List<ResultMetadatum> resultMetadata;
  int databaseId;
  bool enableEmbedding;
  int? collectionId;
  String queryType;
  String name;
  int queryAverageDuration;
  int creatorId;
  List<dynamic> moderationReviews;
  DateTime updatedAt;
  dynamic madePublicById;
  dynamic embeddingParams;
  dynamic cacheTtl;
  DatasetQuery datasetQuery;
  int id;
  List<dynamic> parameterMappings;
  String display;
  String entityId;
  bool collectionPreview;
  CardVisualizationSettings visualizationSettings;
  List<dynamic> parameters;
  bool dataset;
  DateTime createdAt;
  dynamic publicUuid;

  Card({
    required this.description,
    required this.archived,
    required this.collectionPosition,
    required this.tableId,
    required this.resultMetadata,
    required this.databaseId,
    required this.enableEmbedding,
    required this.collectionId,
    required this.queryType,
    required this.name,
    required this.queryAverageDuration,
    required this.creatorId,
    required this.moderationReviews,
    required this.updatedAt,
    required this.madePublicById,
    required this.embeddingParams,
    required this.cacheTtl,
    required this.datasetQuery,
    required this.id,
    required this.parameterMappings,
    required this.display,
    required this.entityId,
    required this.collectionPreview,
    required this.visualizationSettings,
    required this.parameters,
    required this.dataset,
    required this.createdAt,
    required this.publicUuid,
  });
}

class DatasetQuery {
  String type;
  int database;
  Query query;

  DatasetQuery({
    required this.type,
    required this.database,
    required this.query,
  });
}

class Query {
  String sourceTable;

  Query({
    required this.sourceTable,
  });
}

class ResultMetadatum {
  String displayName;
  List<dynamic> fieldRef;
  String name;
  String baseType;
  String effectiveType;
  dynamic semanticType;
  Fingerprint fingerprint;

  ResultMetadatum({
    required this.displayName,
    required this.fieldRef,
    required this.name,
    required this.baseType,
    required this.effectiveType,
    required this.semanticType,
    required this.fingerprint,
  });
}

class FieldRefClass {
  String baseType;

  FieldRefClass({
    required this.baseType,
  });
}

class Fingerprint {
  Global global;
  Type type;

  Fingerprint({
    required this.global,
    required this.type,
  });
}

class Global {
  int distinctCount;
  int nil;

  Global({
    required this.distinctCount,
    required this.nil,
  });
}

class Type {
  TypeText? typeText;
  TypeNumber? typeNumber;

  Type({
    this.typeText,
    this.typeNumber,
  });
}

class TypeNumber {
  int min;
  int q1;
  int q3;
  int max;
  double? sd;
  double avg;

  TypeNumber({
    required this.min,
    required this.q1,
    required this.q3,
    required this.max,
    required this.sd,
    required this.avg,
  });
}

class TypeText {
  int percentJson;
  int percentUrl;
  int percentEmail;
  int percentState;
  double averageLength;

  TypeText({
    required this.percentJson,
    required this.percentUrl,
    required this.percentEmail,
    required this.percentState,
    required this.averageLength,
  });
}

class CardVisualizationSettings {
  String tablePivotColumn;
  String tableCellColumn;

  CardVisualizationSettings({
    required this.tablePivotColumn,
    required this.tableCellColumn,
  });
}

class OrderedCardVisualizationSettings {
  OrderedCardVisualizationSettings();
}

class Parameter {
  String id;
  String type;
  String name;
  String slug;

  Parameter({
    required this.id,
    required this.type,
    required this.name,
    required this.slug,
  });
}
