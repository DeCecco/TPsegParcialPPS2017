import { NgModule } from '@angular/core';
import { PopoverComponent } from './popover/popover';
import { EstadoAsistenciaComponent } from './estado-asistencia/estado-asistencia';
import { SelectCountryComponent } from './select-country/select-country';
@NgModule({
	declarations: [PopoverComponent,
    EstadoAsistenciaComponent,
    SelectCountryComponent],
	imports: [],
	exports: [PopoverComponent,
    EstadoAsistenciaComponent,
    SelectCountryComponent]
})
export class ComponentsModule {}
