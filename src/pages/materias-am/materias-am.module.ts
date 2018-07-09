import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { MateriasAmPage } from './materias-am';

@NgModule({
  declarations: [
    MateriasAmPage,
  ],
  imports: [
    IonicPageModule.forChild(MateriasAmPage),
  ],
})
export class MateriasAmPageModule {}
