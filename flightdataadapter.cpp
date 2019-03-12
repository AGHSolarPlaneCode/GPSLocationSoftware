#include "flightdataadapter.h"
#include <QDebug>

FlightDataAdapter::FlightDataAdapter(QObject *parent) : QObject(parent)
{}


void FlightDataAdapter::SetFlightData(FlightData newData){
    data = newData;
    emit flightDataChanged();
}

void FlightDataAdapter::reciveReq(){
    emit sendLocationToWeather(QGeoCoordinate(data.Lat, data.Lon));
}

int FlightDataAdapter::TimeBootMs() const{
    return static_cast<int>(data.TimeBootMs);
}
int FlightDataAdapter::Lat () const{
return data.Lat;
}
int FlightDataAdapter::Lon () const{
    return data.Lon;
}
int FlightDataAdapter::Alt () const{
    return data.Alt;
}
int FlightDataAdapter::RelativeAlt () const{
    return data.RelativeAlt;
}
int FlightDataAdapter::Vx () const{
    return data.Vx;
}
int FlightDataAdapter::Vy () const{
    return data.Vy;
}
int FlightDataAdapter::Vz () const{
    return data.Vz;
}
int FlightDataAdapter::Hdg () const{
    return static_cast<int>(data.Hdg);
}
