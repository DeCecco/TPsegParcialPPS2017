import { NgModule } from '@angular/core';
import { PopoverComponent } from './popover/popover';
import { EstadoAsistenciaComponent } from './estado-asistencia/estado-asistencia';
@NgModule({
	declarations: [PopoverComponent,
    EstadoAsistenciaComponent],
	imports: [],
	exports: [PopoverComponent,
    EstadoAsistenciaComponent]
})
export class ComponentsModule {}
