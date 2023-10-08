import 'package:mobile_opservapp/lib.dart';

ChartData chartDataFromJSON(JSON json) {
  print(json);
  return ChartData(
    description: json['description'],
    archived: json['archived'] as bool,
    id: json['id'],
    name: json['name'],
    collectionPosition: json['collectionPosition'],
    orderedCards: [],
    paramValues: (json['paramValues']),
    autoApplyFilters: json['autoApplyFilters'] as bool,
    cacheTtl: json['cacheTtl'],
    canWrite: json['canWrite'] as bool,
    caveats: json['caveats'],
    collection: collectionFromJSON(json['collection'] as JSON),
    collectionId: json['collectionId'],
    collectionAuthorityLevel: json['collectionAuthorityLevel'],
    createdAt: DateTime.parse(json['createdAt']),
    creatorId: json['creatorId'],
    embeddingParams: json['embeddingParams'],
    enableEmbedding: json['enableEmbedding'] as bool,
    orderedTabs: (json['orderedTabs']),
    entityId: json['entityId'],
    lastEditInfo: lastEditInfoFromJSON(json['lastEditInfo'] as JSON),
    madePublicById: json['madePublicById'],
    paramFields: (json['paramFields']),
    parameters:
        (json['parameters']).map((e) => parameterFromJSON(e as JSON)).toList(),
    pointsOfInterest: (json['pointsOfInterest']),
    position: json['position'],
    publicUuid: json['publicUuid'],
    showInGettingStarted: json['showInGettingStarted'] as bool,
    updatedAt: DateTime.parse(json['updatedAt']),
  );
}

OrderedCard cardDataFromJSON(JSON json) {
  return OrderedCard(
    id: json['id'],
    actionId: json['actionId'],
    cardId: json['cardId'],
    card: cardFromJSON(json['card'] as JSON),
    col: json['col'],
    collectionAuthorityLevel: json['collectionAuthorityLevel'],
    createdAt: DateTime.parse(json['createdAt']),
    dashboardId: json['dashboardId'],
    dashboardTabId: json['dashboardTabId'],
    entityId: json['entityId'],
    parameterMappings: (json['parameterMappings']),
    row: json['row'],
    series: json['series'],
    sizeX: json['sizeX'],
    sizeY: json['sizeY'],
    updatedAt: DateTime.parse(json['updatedAt']),
    visualizationSettings: json['visualizationSettings'],
  );
}

Collection collectionFromJSON(JSON json) {
  return Collection(
    id: json['id'],
    archived: json['archived'] as bool,
    createdAt: DateTime.parse(json['createdAt']),
    description: json['description'],
    name: json['name'],
    authorityLevel: json['authorityLevel'],
    color: json['color'],
    entityId: json['entityId'],
    location: json['location'],
    namespace: json['namespace'],
    personalOwnerId: json['personalOwnerId'],
    slug: json['slug'],
    type: json['type'],
  );
}

LastEditInfo lastEditInfoFromJSON(JSON json) {
  return LastEditInfo(
    id: json['id'],
    email: json['email'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    timestamp: DateTime.parse(json['timestamp']),
  );
}

Parameter parameterFromJSON(JSON json) {
  return Parameter(
    id: json['id'],
    name: json['name'],
    slug: json['slug'],
    type: json['type'],
  );
}

Card cardFromJSON(JSON json) {
  return Card(
    id: json['id'],
    archived: json['archived'] as bool,
    createdAt: DateTime.parse(json['createdAt']),
    description: json['description'],
    name: json['name'],
    collectionId: json['collectionId'],
    entityId: json['entityId'],
    updatedAt: DateTime.parse(json['updatedAt']),
    cacheTtl: json['cacheTtl'],
    collectionPosition: json['collectionPosition'],
    collectionPreview: json['collectionPreview'] as bool,
    creatorId: json['creatorId'],
    databaseId: json['databaseId'],
    enableEmbedding: json['enableEmbedding'] as bool,
    dataset: json['dataset'] as bool,
    embeddingParams: json['embeddingParams'],
    datasetQuery: datasetQueryFromJSON(json['datasetQuery'] as JSON),
    display: json['display'],
    madePublicById: json['madePublicById'],
    moderationReviews: (json['moderationReviews']),
    parameterMappings: (json['parameterMappings']),
    parameters: (json['parameters']),
    publicUuid: json['publicUuid'],
    queryAverageDuration: json['queryAverageDuration'],
    queryType: json['queryType'],
    resultMetadata: json['resultMetadata']
        .map((e) => resultMetadataFromJSON(e as JSON))
        .toList(),
    tableId: json['tableId'],
    visualizationSettings: cardVisualizationSettingsFromJSON(
        json['visualizationSettings'] as JSON),
  );
}

DatasetQuery datasetQueryFromJSON(JSON json) => DatasetQuery(
      type: json['type'],
      database: json['database'],
      query: queryFromJSON(json['query'] as JSON),
    );

Query queryFromJSON(JSON json) => Query(
      sourceTable: json['sourceTable'],
    );

ResultMetadatum resultMetadataFromJSON(JSON json) => ResultMetadatum(
      name: json['name'],
      baseType: json['baseType'],
      displayName: json['displayName'],
      effectiveType: json['effectiveType'],
      fieldRef: json['fieldRef'] as List,
      fingerprint: fingerprintFromJSON(json['fingerprint'] as JSON),
      semanticType: json['semanticType'],
    );

Fingerprint fingerprintFromJSON(JSON json) => Fingerprint(
      global: globalFromJSON(json['global'] as JSON),
      type: typeFromJSON(json['type'] as JSON),
    );

Global globalFromJSON(JSON json) => Global(
      distinctCount: json['distinctCount'],
      nil: json['nil'],
    );

Type typeFromJSON(JSON json) => Type(
      typeNumber: typeNumberFromJSON(json['type/number'] as JSON?),
      typeText: typeTextFromJSON(json['type/text'] as JSON?),
    );

TypeNumber? typeNumberFromJSON(JSON? json) => json != null
    ? TypeNumber(
        min: json['min'],
        max: json['max'],
        avg: json['avg'] as double,
        q1: json['q1'],
        q3: json['q3'],
        sd: json['sd'] as double,
      )
    : null;

TypeText? typeTextFromJSON(JSON? json) => json != null
    ? TypeText(
        averageLength: json['averageLength'] as double,
        percentEmail: json['percentEmail'],
        percentJson: json['percentJson'],
        percentUrl: json['percentUrl'],
        percentState: json['percentState'],
      )
    : null;

CardVisualizationSettings cardVisualizationSettingsFromJSON(JSON json) =>
    CardVisualizationSettings(
      tablePivotColumn: json['tablePivotColumn'],
      tableCellColumn: json['tableCellColumn'],
    );
